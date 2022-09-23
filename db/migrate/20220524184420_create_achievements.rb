# frozen_string_literal: true

class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.integer :score

      t.timestamps
    end

    add_reference :achievements, :user, foreign_key: true
    add_reference :achievements, :badge, foreign_key: true
  end
end
