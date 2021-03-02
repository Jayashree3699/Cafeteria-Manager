class RemoveDeliveredFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :delivered, :boolean
  end
end
