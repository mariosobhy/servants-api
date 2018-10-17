class Conference < ApplicationRecord
  validates :name,
            :price,
            :place,
            presence: true
end
