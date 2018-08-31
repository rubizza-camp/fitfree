module CalendarHelper
  def self.birthday_clients_list(user_id)
    client_birthday_list = []
    Client.where(user_id: user_id).each do |client|
      client_birthday_list << client if client.birth.day == DateTime.now.day && client.birth.day == DateTime.now.day
    end
    client_birthday_list
  end
end
