module ProductBehavior
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many category_association_name,
                            join_table: join_table_name,
                            foreign_key: product_foreign_key,
                            association_foreign_key: category_foreign_key

    has_many :product_likes_class, foreign_key: product_foreign_key, dependent: :destroy
    has_many :likers, through: :product_likes_class, source: :sephcocco_user

    has_many :orders_class, foreign_key: product_foreign_key
    has_many :buyers, through: :orders_class, source: :sephcocco_user
  end

  class_methods do
    def category_association_name
      raise NotImplementedError, "Define self.category_association_name in your model"
    end

    def join_table_name
      raise NotImplementedError, "Define self.join_table_name in your model"
    end

    def product_foreign_key
      raise NotImplementedError, "Define self.product_foreign_key in your model"
    end

    def category_foreign_key
      raise NotImplementedError, "Define self.category_foreign_key in your model"
    end

    def product_likes_class
      raise NotImplementedError, "Define self.product_likes_class in your model"
    end

    def orders_class
      raise NotImplementedError, "Define self.orders_class in your model"
    end
  end
end
