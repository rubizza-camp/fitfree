# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
BirthdayNotificationWorker.perform_at(DateTime.now).to_f
