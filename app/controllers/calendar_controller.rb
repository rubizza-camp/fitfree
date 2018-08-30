require 'json'
require 'googleauth'
require 'google/apis/calendar_v3'

class CalendarController < ApplicationController
  before_action :authenticate_user!

  def index
    begin
      client = Signet::OAuth2::Client.new(client_options)
      client.update!(session[:authorization])
      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client
      @calendar = Calendar.find_by(user_id: current_user.id)
      if @calendar != nil
        @calendar_summary = service.get_calendar(@calendar.calendar_id).summary
      end
    rescue Google::Apis::AuthorizationError
      if client.refresh_token == nil
        refresh_token = Calendar.find_by(user_id: current_user.id).code
        client.refresh_token = refresh_token
      end
      response = client.refresh!
      session[:authorization] = session[:authorization].merge(response)
      retry
    end
    $client_birthday_list = []
    Client.where(user_id: current_user.id).each { |client| $client_birthday_list << client if client.birth.day == DateTime.now.day && client.birth.day == DateTime.now.day }
    $client_birthday_list = $client_birthday_list.to_json
  end

  def new
    begin
      client = Signet::OAuth2::Client.new(client_options)
      client.update!(session[:authorization])
      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client
      @calendar = Calendar.new
      @calendars = []
      service.list_calendar_lists.items.each do |item|
        calendar = []
        calendar[1] = item.id
        calendar[2] = item.summary
        @calendars << calendar
      end
    rescue Google::Apis::AuthorizationError
      if client.refresh_token == nil
        refresh_token = Calendar.find_by(user_id: current_user.id).code
        client.refresh_token = refresh_token
      end
      response = client.refresh!
      session[:authorization] = session[:authorization].merge(response)
      retry
    end
  end

  def create
    @calendar = Calendar.new(user_id: current_user.id, calendar_id: params[:calendar_id], code: session[:authorization]['refresh_token'])
    @calendar.save
    redirect_to calendar_index_path
  end

  def download
    @training = Training.where(user_id: current_user)
    @data = []
    @training.each do |training|
      date = training.time.to_s.delete ' UTC'
      client = Client.find_by(id: training.client_id)
      info = {
          title: client.full_name,
          start: date[0...10].to_s + ' ' + date[10...15],
          id: training.id
      }
      @data << info
    end
    render json: @data.to_json
  end

  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]
    response = client.fetch_access_token!
    session[:authorization] = response
    redirect_to new_calendar_path
  end

  def redirect
    client = Signet::OAuth2::Client.new(client_options)
    redirect_to client.authorization_uri.to_s
  end

  private
  def client_options
    {
        access_type: 'offline',
        client_id: Rails.application.secrets.google_client_id,
        client_secret: Rails.application.secrets.google_client_secret,
        authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
        grant_type: 'refresh_token',
        user_id: current_user.id,
        scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
        redirect_uri: callback_url
    }
  end
end
