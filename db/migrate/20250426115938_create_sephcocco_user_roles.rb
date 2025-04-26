class CreateSephcoccoUserRoles < ActiveRecord::Migration[7.2]
  def up
    create_table :sephcocco_user_roles, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :sephcocco_user_roles, :name, unique: true
  end

  def down
    drop_table :sephcocco_user_roles
  end
end
