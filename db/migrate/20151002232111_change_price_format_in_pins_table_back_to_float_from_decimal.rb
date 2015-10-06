class ChangePriceFormatInPinsTableBackToFloatFromDecimal < ActiveRecord::Migration
  def up
   change_column :pins, :price, :float
  end

  def down
   change_column :pins, :price, :decimal
  end
end
