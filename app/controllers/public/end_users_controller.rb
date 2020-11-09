class Public::EndUsersController < ApplicationController
  def show
  end

  def edit
   @end_user = current_end_user
  end

  def update
   @end_user = current_end_user
  	if @end_user.update(end_user_params)
       redirect_to end_users_mypage_path
    else
       render 'edit'
    end
  end

  def hide_confirm
  end

 def hide
   end_user = current_end_user
   end_user.destroy
   redirect_to new_end_user_session_path
 end

private
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number)
 end

end