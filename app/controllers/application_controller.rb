class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_homes_top_path
    when EndUser
      end_users_mypage_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
          new_admin_session_path
      elsif resource_or_scope == :end_user
          new_end_user_session_path
      end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number])
  end

  private
  #セッションの作成
  def current_cart_item
    # セッションから取得したcartitem_idを元にCartitemテーブルからCartitem情報を取得
    current_cart_item = CartItem.find_by(id: session[:cartitem_id])
    # Cartitem情報が存在しない場合、@current_cartitemを作成
    current_cart_item = CartItem.create unless current_cart_item
    # 取得したCartitem情報よりIDを取得し、セッションに設定
    session[:cart_item_id] = current_cart_item.id
    # Cartitem情報を返却
    current_cart_item
  end
end
