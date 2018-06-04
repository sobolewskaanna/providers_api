require 'rails_helper'

RSpec.describe Provider, type: :model do
  context 'validations' do
    subject { build :provider }

    it { is_expected.to validate_presence_of(:provider_id) }
    it { is_expected.to validate_uniqueness_of(:provider_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:street_address) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:hospital_referral_region_description) }
  end
end
