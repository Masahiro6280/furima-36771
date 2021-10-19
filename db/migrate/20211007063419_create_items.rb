class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps


      t.string :item_name,         null: false
      t.text :title,               null: false
      t.integer :delivery_fee_id,  null: false
      t.integer :category_id,      null: false
      t.integer :status_id,        null: false
      t.integer :area_id,          null: false
      t.integer :period_id,        null: false
      t.integer :place,            null: false
      t.references :user,          null: false,foreign_key: true 
    end
  end
end
