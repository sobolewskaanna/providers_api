class Provider < ApplicationRecord
  has_many :summaries

  validates :provider_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :hospital_referral_region_description, presence: true
end
