class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :country
      t.string :pincode

      t.timestamps
    end
  end
end
