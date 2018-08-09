require 'json'

class CalendarController < ApplicationController
  before_action :authenticate_user!

  def index
    @training = Training.where(user_id: current_user)
    @data = []
    @training.each do |tr|
      date = tr.time.to_s.delete " UTC"
      info = {
          title: 'Тренировка с клиентом ' + tr.client_id.to_s,
          start: date[0...10] + ' ' + date[10...18],
          price: tr.price,
          description: tr.description,
          status: tr.status
      }
      @data << info
    end
    File.open('app/assets/javascripts/trainings.json', 'w') { |file| file.write(@data.to_json) }
  end
end
