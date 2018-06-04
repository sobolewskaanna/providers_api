require 'rails_helper'

RSpec.describe Summary, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:drg_definition) }
    it { is_expected.to validate_presence_of(:total_discharges) }
    it { is_expected.to validate_presence_of(:average_covered_charges) }
    it { is_expected.to validate_presence_of(:average_total_payments) }
    it { is_expected.to validate_presence_of(:average_medicare_payments) }
  end

  context 'monetize' do
    it { is_expected.to monetize(:average_covered_charges).as(:average_covered_charges_amount) }
    it { is_expected.to monetize(:average_total_payments).as(:average_total_payments_amount) }
    it { is_expected.to monetize(:average_medicare_payments).as(:average_medicare_payments_amount) }
  end
end
