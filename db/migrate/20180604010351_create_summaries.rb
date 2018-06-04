class CreateSummaries < ActiveRecord::Migration[5.2]
  def change
    create_table :summaries, id: :uuid do |t|
      t.string :drg_definition, null: false
      t.integer :total_discharges, null: false, default: 0
      t.integer :average_covered_charges, null: false, default: 0
      t.integer :average_total_payments, null: false, default: 0
      t.integer :average_medicare_payments, null: false, default: 0

      t.timestamps
    end
  end
end
