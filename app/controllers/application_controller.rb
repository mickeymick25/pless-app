class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
	def set_locale
		# Get locale from Domain Name
		#I18n.locale = extract_locale_from_tld

		# Get locale from subdomain
		#I18n.locale = extract_locale_from_subdomain

		# Get locale from URL Params
		I18n.locale = params[:locale] 
		#if params[:locale] is nil then I18n.default_locale will be used
		#I18n.locale = params[:locale] || ((lang = request.env['HTTP_ACCEPT_LANGUAGE']) && lang[/^[a-z]{2}/])
		
	end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
