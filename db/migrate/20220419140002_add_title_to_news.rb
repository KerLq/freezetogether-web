class AddTitleToNews < ActiveRecord::Migration[7.0]
  def change
    add_column :news, :title, :string, default: "This is a placeholder, please remind the support team to change it"
  end
end
