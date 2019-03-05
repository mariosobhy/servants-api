class Hobby < ApplicationRecord
  belongs_to :user, optional: true
end
