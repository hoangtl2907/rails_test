class CreateBook < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.integer :price, null: false

      t.timestamps
    end

    create_table :admin_users_books do |t|
      t.integer :admin_user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
