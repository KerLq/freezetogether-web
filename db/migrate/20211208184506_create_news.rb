# frozen_string_literal: true

class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.text :cover_image
      t.string :content
      t.string :description

      t.timestamps
    end
  end
end
