class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :username, null: false
      t.string :password_digest, null: false

      t.integer :role, default: 0, null: false
			t.string :description, default: 'Ich bin neu bei Freeze Together!'

			t.boolean :tos, default: false, null: false
			t.boolean :email_confirmed, default: false, null: false
			t.string :confirm_token

      t.timestamps
    end
  end
end
