class Course < ApplicationRecord
  has_many :cohorts, :dependent => :destroy

  default_scope { order(:id) }
end
