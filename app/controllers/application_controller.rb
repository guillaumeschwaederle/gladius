class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :profile_present?


  def after_sign_in_path_for(resource)
    seances_path(current_user) #your path
  end

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

 private

   def profile_present?
     if current_user && current_user.profile.nil?
      return redirect_to new_profile_path
      end
     # unless user_signed_in? && current_user.profile.present?
   end
end
