class AddForSaleToPins < ActiveRecord::Migration
  def change
    add_column :pins, :for_sale, :boolean, :default => false
  end
end
