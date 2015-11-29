class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:host).permit(:name, :mobile, :email, :password, :password_confirmation)
  end
end
