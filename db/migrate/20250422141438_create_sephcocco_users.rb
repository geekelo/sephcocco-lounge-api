class CreateSephcoccoUsers < ActiveRecord::Migration[7.2]
  def up
    create_table :sephcocco_users, id: :uuid do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.text :address
      t.string :phone_number
      t.string :whatsapp_number

      t.timestamps
    end

    add_index :sephcocco_users, :email, unique: true
  end

  def down
    remove_index :users, :email
    drop_table :users
  end
end
