class SephcoccoUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :phone_number, :whatsapp_number, :created_at, :updated_at
end
