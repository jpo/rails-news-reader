class RegistrationsController < Devise::RegistrationsController
  def confirm
  end

  protected

  def after_inactive_sign_up_path_for(_resource)
    confirm_user_registration_path
  end

  def after_update_path_for(_resource)
    edit_user_registration_path
  end
end
