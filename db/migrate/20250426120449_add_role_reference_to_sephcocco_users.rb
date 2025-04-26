# db/migrate/20250426120000_add_role_reference_to_sephcocco_users.rb

class AddRoleReferenceToSephcoccoUsers < ActiveRecord::Migration[7.2]
  def up
    add_reference :sephcocco_users, :sephcocco_user_role, null: false, foreign_key: true, type: :uuid
  end

  def down
    remove_reference :sephcocco_users, :sephcocco_user_role, foreign_key: true
  end
end
