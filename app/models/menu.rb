class Menu < ApplicationRecord   
    has_many :menu_items
    validates :name , presence: true
    def self.enabled_menu_items
        enabled_menus = all.where(enabled: true)
        available_menu_items = Array.new
        enabled_menus.all.each do |menu|    
            MenuItem.of_menu(menu.id).each do |item|
                available_menu_items.push(item)
            end    
        end 
        available_menu_items   
    end  

    def self.name_exists?(name)
        all.where("lower(name) = ?", name.downcase).exists?
    end  
    
    def self.destroyed?(menu_id)
        if Menu.exists?(menu_id)
            menu = Menu.find(menu_id)
            MenuItem.of_menu(menu_id).each do |item|
                item.destroy
            end    
            menu.destroy
            return true
        else
            return false
        end    
    end    
end