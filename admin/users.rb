ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :phone_number, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  permit_params do
    permitted = [:name, :phone_number, :email, :reset_password_token, :reset_password_sent_at, :remember_created_at]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end
  
end
