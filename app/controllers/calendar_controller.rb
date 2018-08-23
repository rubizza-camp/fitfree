require 'json'

class CalendarController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def download
    @training = Training.where(user_id: current_user)
    @data = []
    @training.each do |training|
      date = training.time.to_s.delete ' UTC'
      client = Client.find_by(id: training.client_id)
      info = {
          title: Client.find_by(id: training.client_id).first_name + ' ' + Client.find_by(id: training.client_id).second_name,
          start: date[0...10].to_s + ' ' + date[10...15],
          id: training.id
      }
      @data << info
    end
    google = {
        googleCalendarId: 'k9qatn9fshgu56rhtccrec0dao@group.calendar.google.com',
        color: 'yellow',
        textColor: 'black'
    }
    @data << google
    render json: @data.to_json
  end
end
