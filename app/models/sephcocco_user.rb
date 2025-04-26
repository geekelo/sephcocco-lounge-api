class SephcoccoUser < ApplicationRecord
  belongs_to :sephcocco_user_role, optional: true
end