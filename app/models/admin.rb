class Admin < ApplicationRecord
  has_one :profile, :as => :profileable, :dependent => :destroy
  accepts_nested_attributes_for :profile

  def full_name
    "#{first_name} #{last_name}"
  end
end
