class Summary < ApplicationRecord
  validates :drg_definition, presence: true
  validates :total_discharges, presence: true
  validates :average_covered_charges, presence: true
  validates :average_total_payments, presence: true
  validates :average_medicare_payments, presence: true
end
