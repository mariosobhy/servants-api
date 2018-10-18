class SpiritualDay < ApplicationRecord
  validates :name,
            :price,
            :place,
            presence: true
end
