class AddGameToAchievements < ActiveRecord::Migration[7.0]
  def change
    add_reference :achievements, :game, foreign_key: true
  end
end
