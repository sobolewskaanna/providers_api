class AddReferenceToSummary < ActiveRecord::Migration[5.2]
  def change
    add_reference :summaries, :provider, type: :uuid, index: true, foreign_key: true
  end
end
