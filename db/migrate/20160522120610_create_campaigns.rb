class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :candidate
      t.integer :score, :default => 0
      t.integer :invalid_score, :default => 0

      t.timestamps null: false
    end
  end
end
