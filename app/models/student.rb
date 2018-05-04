class Student < ApplicationRecord
  has_many :grades, :dependent => :destroy
  has_many :cohorts, :through => :grades

  default_scope { order(:id) }
end
