class ChangeAmountTypeInPurchases < ActiveRecord::Migration
  def up
   change_column :purchases, :amount, :float
  end

  def down
   change_column :purchases, :amount, :integer
  end
end
