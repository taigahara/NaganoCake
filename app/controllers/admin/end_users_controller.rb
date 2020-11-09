class Admin::EndUsersController < ApplicationController
  def index
	  @end_users = EndUser.all
  end
  
  private
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number)
 end
end
