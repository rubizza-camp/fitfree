class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    locale = extract_locale_from_accept_language_header
    I18n.locale = locale == 'ru' ? :ru  : I18n.default_locale
    logger.debug "* Locale set to '#{I18n.locale}'"
  end

  def get_locale
    render plain: I18n.locale
  end

  def pundit_user
    current_user || current_admin
  end

  private

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
