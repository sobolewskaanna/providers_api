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

  scope :with_max_discharges, lambda { |max_discharge|
    where('total_discharges <= ?', max_discharge) if max_discharge.present?
  }

  scope :with_min_discharges, lambda { |min_discharge|
    where('total_discharges >= ?', min_discharge) if min_discharge.present?
  }

  scope :with_max_average_covered_charges, lambda { |max_average_covered_charge|
    if max_average_covered_charge.present?
      where('average_covered_charges <= ?', max_average_covered_charge)
    end
  }

  scope :with_min_average_covered_charges, lambda { |min_average_covered_charge|
    if min_average_covered_charge.present?
      where('average_covered_charges >= ?', min_average_covered_charge)
    end
  }

  scope :with_max_average_medicare_payments, lambda { |max_average_medicare_payment|
    if max_average_medicare_payment.present?
      where('average_medicare_payments <= ?', max_average_medicare_payment)
    end
  }

  scope :with_min_average_medicare_payments, lambda { |min_average_medicare_payment|
    if min_average_medicare_payment.present?
      where('average_medicare_payments >= ?', min_average_medicare_payment)
    end
  }

  scope :with_state, lambda { |state|
    joins(:provider).where(providers: { state: state }) if state.present?
  }

  def self.execute_custom_query(valid_params)
    with_state(valid_params[:state])
      .with_max_discharges(valid_params[:max_discharges])
      .with_min_discharges(valid_params[:min_discharges])
      .with_max_average_covered_charges(valid_params[:max_average_covered_charges])
      .with_min_average_covered_charges(valid_params[:min_average_covered_charges])
      .with_max_average_medicare_payments(valid_params[:max_average_medicare_payments])
      .with_min_average_medicare_payments(valid_params[:min_average_medicare_payments])
  end
end
