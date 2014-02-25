class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end
