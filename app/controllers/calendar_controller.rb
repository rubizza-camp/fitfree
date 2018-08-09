require 'json'

class CalendarController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def download
    @training = Training.where(user_id: current_user)
    @data = []
    @training.each do |tr|
      date = tr.time.to_s.delete " UTC"
      info = {
          title: 'Клиент ' + tr.client_id.to_s,
          start: date[0...10].to_s + ' ' + date[10...15],
          price: tr.price,
          description: tr.description,
          status: tr.status
      }
      @data << info
    end
    render json: @data.to_json
  end
end
