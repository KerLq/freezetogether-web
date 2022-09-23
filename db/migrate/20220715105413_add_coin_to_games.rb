# frozen_string_literal: true

class AddCoinToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :coin, :integer
  end
end
