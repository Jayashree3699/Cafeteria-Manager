class User < ApplicationRecord
    has_secure_password

    has_many :orders

    validates :name, :role, :email, :password, presence: true
    validates :name, length: { minimum: 4 }
    validates :password, length: { in: 6..20 }

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