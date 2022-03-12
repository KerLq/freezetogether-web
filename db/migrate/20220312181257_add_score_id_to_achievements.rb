class AddScoreIdToAchievements < ActiveRecord::Migration[6.1]
  def change
    add_column :achievements, :score_id, :integer
  end
end
