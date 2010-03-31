# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :load_preferences
  before_filter :setup
  before_filter :rpx_setup
  before_filter :authenticate

  def load_preferences
    @preferences = {}
    @preferences[:new_inquiry_email_address] = '1233342-asdad@aidhd.com'
  end

  private
  def setup
    get_user_id
  end

  def authenticate
    login_required
  end

  def get_user_id
    user_id = session[:user_id]
    if user_id
      @current_user = User.find_by_id user_id
    end
  end

  def login_required
    @current_user = User.first if ENV['DISABLE_RPX']
    redirect_to login_path unless @current_user
  end

  def unauthorized
    render :text => 'unauthorized'
  end

  def rpx_setup
    return true if ENV['DISABLE_RPX']
    unless Object.const_defined?(:API_KEY) && Object.const_defined?(:BASE_URL) && Object.const_defined?(:REALM)
      render :template => '/layouts/invalid'
      return false
    end
    @rpx = Rpx::RpxHelper.new(API_KEY, BASE_URL, REALM)
    return true
  end

end
