require 'csv'

csv_file = File.read(Rails.root.join('lib', 'seeds', 'Inpatient_Prospective_Payment_data_MODIFIED.csv'))
csv_content = CSV.parse(csv_file, headers: true, header_converters: ->(f) { f.strip })

csv_content.each do |row|
  provider_record = Provider.find_or_create_by(provider_id: row['Provider Id'].to_i) do |provider|
    provider.name = row['Provider Name']
    provider.street_address = row['Provider Street Address']
    provider.city = row['Provider City']
    provider.state = row['Provider State']
    provider.zip_code = row['Provider Zip Code'].to_i
    provider.hospital_referral_region_description = row['Hospital Referral Region Description']

    puts "Provider#{provider.name} created in the providers table"
  end

  summary = Summary.create(
    drg_definition: row['DRG Definition'],
    total_discharges: row['Total Discharges'],
    average_covered_charges: row['Average Covered Charges'].gsub(/\D/, '').to_i,
    average_total_payments: row['Average Total Payments'].gsub(/\D/, '').to_i,
    average_medicare_payments: row['Average Medicare Payments'].gsub(/\D/, '').to_i,
    provider_id: provider_record.id
  )

  puts "Summary created for #{summary.provider.name}"
end

puts "There are now #{Provider.count} rows in the providers table"
puts "There are now #{Summary.count} rows in the summaries table"
