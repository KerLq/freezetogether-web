class CreateCharacterPerks < ActiveRecord::Migration[7.0]
  def change
    create_table :character_perks do |t|
      t.references :character, foreign_key: true
      t.references :perk, foreign_key: true
      t.timestamps
    end
  end
end
