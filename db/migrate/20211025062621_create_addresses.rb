class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps



      t.string :post_number,            null: false
      t.integer :area_id,               null: false
      t.string :city,                   null: false
      t.string :house_num,              null: false
      t.string :building_name,          null: false
      t.string :phone_number,          null: false
      t.references :order,              null: false
      

    end
  end
end
