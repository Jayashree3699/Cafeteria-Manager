class User < ApplicationRecord
    has_secure_password

    has_many :orders

    validates :name, :email, presence: true
    validates :name, length: { minimum: 4 }

    def self.owners
        User.where(role: "owner")
    end  

    def self.clerks
        User.where(role: "clerk")
    end 
    
    def self.customers
        User.where(role: "customer")
    end 
     
    def self.user_exists?(email)
        all.where("lower(email) = ?", email.downcase).exists?
    end    
   
end    