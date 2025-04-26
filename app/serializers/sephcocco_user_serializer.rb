class SephcoccoUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :phone_number, :whatsapp_number, :created_at, :updated_at

  def role
    object.sephcocco_user_role.name if object.sephcocco_user_role
  end
end
