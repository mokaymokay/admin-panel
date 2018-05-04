class Cohort < ApplicationRecord
  belongs_to :course
  belongs_to :instructor
  has_many :grades, :dependent => :destroy
  has_many :students, :through => :grades

  default_scope { order(:id) }
end
