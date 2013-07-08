class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def deny_access
    redirect_to login_path, :alert => "Please sign in to access this page."
  end

  def mismatch_access
    redirect_to root_path, :alert => "You are not privilaged to use that page"
  end

  def correct_user(user_id)
    @tuser=User.find(user_id)
    @tuser==current_user
  end

  def correct_prop_user(prop_id)
    @tprop=Property.find(prop_id)
    @tuser=User.find(@tprop.user_id)
    @tuser==current_user
  end

  def correct_book_user(book_id)
    @tbook=Booking.find(book_id)
    @tuser=User.find(@tbook.user_id)
    @tuser==current_user
  end

  def admin_access
    redirect_to root_path, :alert => 'Access only to admin'
  end  

  def authenticate
    deny_access unless current_user
  end

  def corr_user
    mismatch_access unless correct_book_user(params[:id])
  end
end
