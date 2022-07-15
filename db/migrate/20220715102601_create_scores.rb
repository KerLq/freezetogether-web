class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.float :score
      t.integer :coin
      t.time :time
      
      t.timestamps
    end
  end
end
