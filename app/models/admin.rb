class Admin < ApplicationRecord
  has_one :user, as: :userable, dependent: :destroy
  accepts_nested_attributes_for :user, allow_destroy: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
