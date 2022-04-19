class AddDescriptionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :description, :string, default: 'Ich bin neu bei Freeze Together!'
  end
end
