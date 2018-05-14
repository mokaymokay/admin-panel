class Course < ApplicationRecord
  has_many :cohorts, dependent: :destroy
  accepts_nested_attributes_for :cohorts, allow_destroy: true

  default_scope { order(:id) }
end
