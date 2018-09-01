# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

BirthdayNotificationWorker.perform_async

EatingNotificationHelper.set_task('10:30')
EatingNotificationHelper.set_task('12:30')
EatingNotificationHelper.set_task('14:30')
EatingNotificationHelper.set_task('16:30')
EatingNotificationHelper.set_task('18:30')
