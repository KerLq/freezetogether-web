class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.text :cover_image
      t.string :content
			t.string :title
      t.string :description

      t.timestamps
    end
  end
end
