class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]
  respond_to :html, :js, :json

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   #@user.images.create image_params
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # You can put the params you want to permit in the empty array.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up).push(:email, :uid, :name, :last_name, :avatar, photos_attributes: [:title, :photo_holder_type, :photo_holder_id, :avatar, :description])
  end

  # You can put the params you want to permit in the empty array.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update).push(:email, :uid, :name, :last_name, :avatar, photos_attributes: [:title, :photo_holder_type, :photo_holder_id, :avatar, :description])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  # def image_params
  #   :title, :holder_type, :holder_id, :avatar, :kind
  # end
  # def sign_up_params
  #   image_params = [:title, :holder_type, :holder_id, :avatar, :kind]
  #   params.require(:user).permit :email, :uid, :name, :last_name, images_attributes: [:title, :holder_type, :holder_id, :avatar, :kind]
  # end
end
