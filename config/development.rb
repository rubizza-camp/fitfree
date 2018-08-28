Rails.application.configure do
  # config.action_cable.url = "ws://localhost:3000/cable"
  config.action_cable.url = `ws://e698727e.ngrok.io/cable`
end