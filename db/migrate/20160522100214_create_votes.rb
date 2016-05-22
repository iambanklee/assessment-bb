class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.datetime :vote_time
      t.string :campaign
      t.string :validity
      t.string :choice

      t.timestamps null: false
    end
  end
end
