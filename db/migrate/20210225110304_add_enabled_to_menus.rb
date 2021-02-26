class AddEnabledToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :enabled, :boolean
  end
end
