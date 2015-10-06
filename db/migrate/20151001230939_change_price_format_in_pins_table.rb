class ChangePriceFormatInPinsTable < ActiveRecord::Migration
  def up
   change_column :pins, :price, :decimal, :precision => 8, :scale => 2
  end

  def down
   change_column :pins, :price, :float
  end
end
