# lib/migration_helpers/image_urls_column_helper.rb

module ImageUrlsColumnHelper
  def add_image_urls_column(table_name)
    add_column table_name.to_sym, :image_urls, :string, array: true, default: []
  end

  def remove_image_urls_column(table_name)
    remove_column table_name.to_sym, :image_urls
  end
end
