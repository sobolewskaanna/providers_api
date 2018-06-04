FactoryBot.define do
  factory :summary do
    drg_definition '039 - EXTRACRANIAL PROCEDURES W/O CC/MCC'
    total_discharges 91
    average_covered_charges 21_096_94
    average_total_payments 8_148_67
    average_medicare_payments 7_403_25
  end

  factory :provider do
    provider_id 1001
    name 'SOUTHEAST ALABAMA MEDICAL CENTER'
    street_address '1108 ROSS CLARK CIRCLE'
    city 'San Francisco'
    state 'CA'
    zip_code 94_103
    hospital_referral_region_description 'CA - San Francisco'
  end
end
