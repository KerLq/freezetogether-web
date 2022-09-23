# frozen_string_literal: true

class CreateGame < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :character
      t.integer :score
      t.integer :stage
      t.integer :time

      t.timestamps
    end

    add_reference :games, :user, foreign_key: true
  end
end
