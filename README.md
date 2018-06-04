# Providers API

This Healthcare Providers API allows for querying healthcare providers by specifying the following:

Endpoint: `GET /providers`

Parameters:

| Parameter                     | Description                               |
| ----------------------------- |:----------------------------------------- |
| max_discharges                | The maximum number of Total Discharges    |
| min_discharges                | The minimum number of Total Discharges    |
| max_average_covered_charges   | The maximum Average Covered Charges       |
| min_average_covered_charges   | The minimum Average Covered Charges       |
| max_average_medicare_payments | The maximum Average Medicare Payment      |
| min_average_medicare_payments | The minimum Average Medicare Payment      |
| state                         | The exact state that the provider is from |

Example query:

`GET /providers?max_discharges=5&min_discharges=6&max_average_covered_charges=50000
&min_average_covered_charges=40000&min_average_medicare_payments=6000
&max_average_medicare_payments=10000&state=GA`

#### Setup

To run this locally: Fork and set up the local database by running `rake db:setup`.

#### Testing
To run the test suite execute `bundle exec rspec`.

#### Architecture
Note: Due to the size contains this API endpoint uses a modified amount of healthcare provider data.

The database is composed of two tables: a provider and summary. The provider table contains the provider's address and descriptions and summary consists of charges for each provider. For the purpose of this exercise, the 'DRG Definition' column from the data set was ignored.

The charges for each provider are stored in cents. `money-rails` gem is used to correctly present the data.

#### Further work to be done:
* Create a model for DRG Definition with a code and corresponding definition.
* Add test for Seed file to make sure that all of the data was seeded correctly.
* Update the seed file to account for nil data and data with unexpected characters.