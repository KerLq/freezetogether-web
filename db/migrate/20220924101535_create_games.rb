class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
			t.integer :score
			t.integer :coin
			t.string :time

			t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
