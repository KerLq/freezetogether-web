# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :title
      t.string :name
      t.string :description
      t.string :quote
      t.timestamps
    end
  end
end
