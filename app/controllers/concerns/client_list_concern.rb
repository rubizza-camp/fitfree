module ClientListConcern
  extend ActiveSupport::Concern

  def client_list(user)
    @list = []
    Client.where(user_id: user).each do |client|
      each = []
      each << client.first_name + ' ' + client.second_name
      each << client.id
      @list << each
    end
    @list
  end
end
