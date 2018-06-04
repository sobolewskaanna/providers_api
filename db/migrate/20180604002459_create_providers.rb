class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers, id: :uuid do |t|
      t.integer :provider_id, null: false
      t.string :name, null: false
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip_code, null: false
      t.string :hospital_referral_region_description, null: false

      t.timestamps
    end
  end
end
