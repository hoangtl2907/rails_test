class AddAgePhoneAddressToAdminUser < ActiveRecord::Migration[6.0]
  def change
    change_table :admin_users, bulk: true do |t|
      t.integer :age
      t.string :phone
      t.string :address
    end
  end
end
