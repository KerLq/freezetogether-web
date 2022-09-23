# frozen_string_literal: true

class AddTosToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :tos, :boolean, default: false
  end
end
