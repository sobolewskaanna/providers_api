require 'rails_helper'

RSpec.describe 'Providers API', type: :request do
  let!(:provider_one) { create :provider_with_summaries }
  let!(:provider_two) { create :provider_with_summaries, provider_id: 1002 }

  describe 'GET /providers' do
    context 'without params' do
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

    context 'with valid params' do
      let!(:provider_three) { create :provider, provider_id: 1003, state: 'AZ' }
      let!(:provider_four) { create :provider, provider_id: 1004, state: 'NY' }
      let!(:summary_1) { create :summary, total_discharges: 12, average_covered_charges: 500, average_medicare_payments: 800, provider_id: provider_three.id }
      let!(:summary_2) { create :summary, total_discharges: 13, average_covered_charges: 300, average_medicare_payments: 700, provider_id: provider_three.id }
      let!(:summary_3) { create :summary, total_discharges: 14, average_covered_charges: 1000, average_medicare_payments: 600, provider_id: provider_four.id }

      it 'defines permitted params' do
        expect_any_instance_of(ActionController::Parameters)
          .to receive(:permit)
          .with(
            :max_discharges,
            :min_discharges,
            :max_average_covered_charges,
            :min_average_covered_charges,
            :max_average_medicare_payments,
            :min_average_medicare_payments,
            :state
          ).and_call_original

        get '/providers?max_discharges=600'
      end

      it 'returns the correct records for optional state param' do
        get '/providers?state=AZ'

        json_response = JSON.parse(response.body)

        expect(json_response).not_to be_empty
        expect(json_response.count).to eq(2)
      end

      it 'returns the correct records for min and max discharges' do
        get '/providers?max_discharges=14&min_discharges=12'

        json_response = JSON.parse(response.body)

        expect(json_response).not_to be_empty
        expect(json_response.count).to eq(3)
      end

      it 'returns the correct records for min average covered payments' do
        get '/providers?max_average_covered_charges=500'

        json_response = JSON.parse(response.body)

        expect(json_response).not_to be_empty
        expect(json_response.count).to eq(2)
      end

      it 'returns the correct records for min average covered payments' do
        get '/providers?max_average_medicare_payments=600'

        json_response = JSON.parse(response.body)

        expect(json_response).not_to be_empty
        expect(json_response.count).to eq(1)
      end
    end

    context 'with invalid params' do
      it 'returns a successful response' do
        get '/providers?boop=beep'

        expect(response.status).to eq(200)
      end

      it 'returns all providers' do
        get '/providers?boop=beep'

        json_response = JSON.parse(response.body)

        expect(json_response).not_to be_empty
        expect(json_response.count).to eq(20)
      end
    end
  end
end
