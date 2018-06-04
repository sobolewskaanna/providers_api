class Summary < ApplicationRecord
  belongs_to :provider

  validates :drg_definition, presence: true
  validates :total_discharges, presence: true
  validates :average_covered_charges, presence: true
  validates :average_total_payments, presence: true
  validates :average_medicare_payments, presence: true

  monetize :average_covered_charges, as: 'average_covered_charges_amount'
  monetize :average_total_payments, as: 'average_total_payments_amount'
  monetize :average_medicare_payments, as: 'average_medicare_payments_amount'
end
