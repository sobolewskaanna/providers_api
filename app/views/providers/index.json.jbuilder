json.array! @summaries do |summary|
  json.set! 'Provider Name', summary.provider.name
  json.set! 'Provider Street Address', summary.provider.street_address
  json.set! 'Provider City', summary.provider.city
  json.set! 'Provider State', summary.provider.state
  json.set! 'Provider Zip Code', summary.provider.zip_code
  json.set! 'Hospital Referral Region Description', summary.provider.hospital_referral_region_description
  json.set! 'Total Discharges', summary.total_discharges
  json.set! 'Average Covered Charges', humanized_money_with_symbol(summary.average_covered_charges_amount)
  json.set! 'Average Total Payments', humanized_money_with_symbol(summary.average_total_payments_amount)
  json.set! 'Average Medicare Payments', humanized_money_with_symbol(summary.average_medicare_payments_amount)
end
