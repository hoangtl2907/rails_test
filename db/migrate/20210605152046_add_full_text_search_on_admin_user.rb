class AddFullTextSearchOnAdminUser < ActiveRecord::Migration[6.0]
  def change
    add_index :admin_users, :name, type: :fulltext
  end
end
