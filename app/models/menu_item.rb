class MenuItem < ApplicationRecord
    belongs_to :menu
    validates :menu_id, :name, :description, :price, presence: true

    def self.is_valid(name , description)
        !all.where("lower(name) = ?", name.downcase).exists? && name.downcase!="name" && description.downcase!="description"
    end    

    def self.of_menu(menu_id)
        all.where("menu_id = ?",menu_id)
    end  

    def self.menu_item_details(menu_id , menu_item_id)
        MenuItem.of_menu(menu_id).find(menu_item_id)
    end    
end    