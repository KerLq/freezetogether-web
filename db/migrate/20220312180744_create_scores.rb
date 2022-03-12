class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.float :score
      t.date :time
      
      t.timestamps
    end
  end
end
