# app/models/concerns/product_behavior.rb
module ProductBehavior
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many category_association_name, {
      join_table: category_join_table,
      foreign_key: product_foreign_key,
      association_foreign_key: category_foreign_key
    }

    has_many :product_likes_association_name, {
      class_name: product_like_class_name,
      foreign_key: product_foreign_key,
      dependent: :destroy
    }

    has_many :likers, through: :product_likes_association_name, source: :sephcocco_user

    has_many :orders_association_name, {
      class_name: order_class_name,
      foreign_key: product_foreign_key
    }

    has_many :buyers, through: :orders_association_name, source: :sephcocco_user
  end

  class_methods do
    def category_association_name
      raise NotImplementedError, "Define self.category_association_name in your model"
    end

    def category_join_table
      raise NotImplementedError, "Define self.category_join_table in your model"
    end

    def product_foreign_key
      raise NotImplementedError, "Define self.product_foreign_key in your model"
    end

    def category_foreign_key
      raise NotImplementedError, "Define self.category_foreign_key in your model"
    end

    def product_likes_association_name
      raise NotImplementedError, "Define self.product_likes_association_name in your model"
    end

    def product_like_class_name
      raise NotImplementedError, "Define self.product_like_class_name in your model"
    end

    def orders_association_name
      raise NotImplementedError, "Define self.orders_association_name in your model"
    end

    def order_class_name
      raise NotImplementedError, "Define self.order_class_name in your model"
    end
  end
end
