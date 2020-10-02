class Holiday < ApplicationRecord
  belongs_to :user
  validates :holiday_division, :holiday_reason, :status, presence: true, on: :create
end
