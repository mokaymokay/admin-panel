class Instructor < ApplicationRecord
  has_many :cohorts
  has_one :profile, :as => :profileable, :dependent => :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true

  default_scope { order(:id) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
