module ProductCategoryJoinsHelper
  def create_product_category_join_table(prefix:, product_table:, category_table:)
    join_table = "#{prefix}_#{product_table.singularize}_categories_#{product_table}".to_sym
    product_fk = "#{prefix}_#{product_table.singularize}_id"
    category_fk = "#{prefix}_#{category_table.singularize}_id"

    create_table join_table, id: :uuid do |t|
      t.uuid product_fk, null: false
      t.uuid category_fk, null: false

      t.timestamps
    end

    add_index join_table, [product_fk, category_fk], unique: true, name: "index_#{join_table}_on_#{product_fk}_and_#{category_fk}"
  end

  def drop_product_category_join_table(prefix:, product_table:, category_table:)
    join_table = "#{prefix}_#{product_table.singularize}_categories_#{product_table}".to_sym
    drop_table join_table
  end
end
