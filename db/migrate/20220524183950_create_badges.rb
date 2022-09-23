# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.text :slug, unique: true
      t.string :name
      t.text :description
      t.integer :max_score
      t.string :image

      t.timestamps
    end
  end
end
