class Menu < ApplicationRecord   
    has_many :menu_items
    def self.enabled_menu_items
        enabled_menus = all.where(enabled: true)
        available_menu_items = Array.new
        enabled_menus.all.each do |menu|
            MenuItem.where(menu_id: menu.id).each do |item|
                available_menu_items.push(item)
            end    
        end 
        available_menu_items   
    end    
end