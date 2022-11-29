# frozen_string_literal: true

class DropPerksTable < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :character_perks, :characters
    remove_foreign_key :character_perks, :perks
    drop_table :perks
    drop_table :character_perks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
