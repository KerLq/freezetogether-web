class CreateAchievements < ActiveRecord::Migration[6.1]
  def change
    create_table :achievements do |t|
      t.string :image
      t.string :name
      t.text :description
      t.float :score
      
      t.timestamps
    end
  end
end
