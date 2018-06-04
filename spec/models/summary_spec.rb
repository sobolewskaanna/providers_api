require 'rails_helper'

RSpec.describe Summary, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:drg_definition) }
    it { is_expected.to validate_presence_of(:total_discharges) }
    it { is_expected.to validate_presence_of(:average_covered_charges) }
    it { is_expected.to validate_presence_of(:average_total_payments) }
    it { is_expected.to validate_presence_of(:average_medicare_payments) }
  end
end
