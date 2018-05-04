class Instructor < ApplicationRecord
  has_many :cohorts
  has_one :profile, :as => :profileable, :dependent => :destroy

  default_scope { order(:id) }
end
