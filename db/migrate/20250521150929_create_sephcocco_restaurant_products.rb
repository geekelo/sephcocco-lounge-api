require_relative '../../lib/migration_helpers/product_migration_helpers'

class CreateSephcoccoRestaurantProducts < ActiveRecord::Migration[7.2]
  include ProductMigrationHelpers

  def up
    create_product_table_for('restaurant')
  end

  def down
    drop_product_table_for('restaurant')
  end
end
