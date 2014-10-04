class HomeController < ApplicationController
  def welcome
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    p request.env['facebook.params']
    if request.env["facebook.params"].present?
      @user = User.from_omniauth(request.env["facebook.params"])

      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.params"]
        redirect_to new_user_registration_url
      end
    end
  end
end
