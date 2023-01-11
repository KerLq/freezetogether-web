class AddScoresToAchievements < ActiveRecord::Migration[7.0]
  def change
    add_column :achievements, :scores, :integer
  end
end
