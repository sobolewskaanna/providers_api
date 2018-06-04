require 'rails_helper'

RSpec.describe 'Providers API', type: :request do
  let!(:provider_one) { create :provider_with_summaries }
  let!(:provider_two) { create :provider_with_summaries, provider_id: 1002 }

  describe 'GET /providers' do
    before { get '/providers' }

    it 'returns status code 200' do
      expect(response.status).to eq(200)
    end

    it 'returns all providers' do
      json_response = JSON.parse(response.body)

      expect(json_response).not_to be_empty
      expect(json_response.count).to eq(20)
    end

    it 'returns json in correct format' do
      json_response = JSON.parse(response.body)

      expect(json_response.first).to eq(
        'Provider Name' => 'SOUTHEAST ALABAMA MEDICAL CENTER',
        'Provider Street Address' => '1108 ROSS CLARK CIRCLE',
        'Provider City' => 'San Francisco',
        'Provider State' => 'CA',
        'Provider Zip Code' => 94_103,
        'Hospital Referral Region Description' => 'CA - San Francisco',
        'Total Discharges' => 91,
        'Average Covered Charges' => '$21,096.94',
        'Average Total Payments' => '$8,148.67',
        'Average Medicare Payments' => '$7,403.25'
      )
    end
  end
end
