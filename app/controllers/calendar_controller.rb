require 'json'
require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

class CalendarController < ApplicationController
  before_action :authenticate_user!

  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
  APPLICATION_NAME = 'Fit Free'.freeze
  CREDENTIALS_PATH = 'credentials.json'.freeze
  TOKEN_PATH = 'token.yaml'.freeze
  SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

  def index; end

  def new
    @calendar = Calendar.new
    google
    @calendars = []
    @service.list_calendar_lists.items.each do |item|
      calendar = []
      calendar[1] = item.id
      calendar[2] = item.summary
      @calendars << calendar
    end
  end

  def create
    @calendar = Calendar.find_by(user_id: current_user.id)
    if @calendar == nil
      @calendar = Calendar.new(user_id: current_user.id, calendar_id: params[:calendar_id])
      @calendar.save
    else
      @calendar.update(calendar_id: params[:calendar_id])
    end

    redirect_to calendar_index_path
  end

  def calendar_id
    #binding.pry
    @calendar = Calendar.order("created_at").where(user_id: current_user.id).last
    if @calendar == nil
      render plain: 'default'
    else
      render plain: @calendar.calendar_id.to_s
    end
  end

  def download
    @training = Training.where(user_id: current_user)
    @data = []
    @training.each do |training|
      date = training.time.to_s.delete " UTC"
      info = {
          title: Client.find_by(id: training.client_id).first_name + ' ' + Client.find_by(id: training.client_id).second_name,
          start: date[0...10].to_s + ' ' + date[10...15],
          id: training.id
      }
      @data << info
    end
    render json: @data.to_json
  end

  def authorize
    client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
    user_id = current_user.id
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
      url = authorizer.get_authorization_url(base_url: OOB_URI)
      puts 'Open the following URL in the browser and enter the ' \
         "resulting code after authorization:\n" + url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: OOB_URI
      )
    end
    credentials
  end

  def google
    @service = Google::Apis::CalendarV3::CalendarService.new
    @service.client_options.application_name = APPLICATION_NAME
    @service.authorization = authorize
  end

  def show
    google
    @calendars = []
    @service.list_calendar_lists.items.each do |item|
      calendar = {}
      calendar[:id] = item.id
      calendar[:summary] = item.summary
      @calendars << calendar
    end
  end
end
