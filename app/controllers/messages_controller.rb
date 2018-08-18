class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @messages = Message.where("messagable_id = 4 or messagable_id = 2 or messagable_type='User' or messagable_type='Client'")
  end

end
