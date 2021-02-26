class User < ApplicationRecord
    has_secure_password

    has_many :orders

    def self.owners
        User.where(role: "owner")
    end  

    def self.clerks
        User.where(role: "clerk")
    end 
    
    def self.customers
        User.where(role: "customer")
    end    
end    