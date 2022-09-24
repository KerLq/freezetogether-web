class CreateAccomplishedAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :accomplished_achievements do |t|
			t.references :achievement, foreign_key: true
			t.references :game, foreign_key: true
			t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
