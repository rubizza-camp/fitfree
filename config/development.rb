Rails.application.configure do
  config.action_cable.url = "ws://localhost:3000/cable"
  # config.action_cable.url = "ws://830515e5.ngrok.io/cable"
end