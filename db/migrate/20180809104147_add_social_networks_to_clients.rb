class AddSocialNetworksToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :instagram_link, :string
    add_column :clients, :facebook_link, :string
    add_column :clients, :vk_link, :string
  end
end
