class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!

  def all
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    # if @user.persisted?
    #   sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    #   set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    # else
    #   session["devise.facebook_data"] = request.env["omniauth.auth"]
    #   redirect_to new_user_registration_url
    # end
    puts request.env["omniauth.auth"]['provider']
    puts request.env["omniauth.auth"].info.email.blank?
    puts @user.inspect
    if @user.persisted?
      puts "1"
      flash[:notice] = "You are in..!!! Go to edit profile to see the status for the accounts"
      sign_in_and_redirect(@user)
    else
      puts "2"
      flash[:error] = "Please enter email address."

      if request.env["omniauth.auth"]['provider'] == 'facebook'
        puts "3"
      
        if request.env["omniauth.auth"].info.email.blank?
          puts "4"
          redirect_to "/users/auth/facebook?auth_type=rerequest&scope=email"
        else
          puts "5"
          redirect_to root_url    
        end
      else
        puts "6"
        redirect_to root_url
      end

      
    end
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  def failure
    super
  end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  alias_method :facebook, :all
  alias_method :twitter, :all
  alias_method :linkedin, :all
  # alias_method :github, :all
  # alias_method :passthru, :all
  alias_method :google_oauth2, :all
end
