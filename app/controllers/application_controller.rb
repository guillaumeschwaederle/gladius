class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :profile_present?
 private

   def profile_present?
     if current_user && current_user.profile.nil?
      return redirect_to new_profile_path
      end
     # unless user_signed_in? && current_user.profile.present?
   end
end
