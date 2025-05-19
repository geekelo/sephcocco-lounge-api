class SephcoccoUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :phone_number, :whatsapp_number, :role, :created_at, :updated_at

  def role
    object&.sephcocco_user_role&.name
  end
end
