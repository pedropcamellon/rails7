class User < ApplicationRecord
    after_create :log_new_user

    validates :first_name, :last_name, :company, :email, :password_digest, presence: true
    validates :password_digest, length: { minimum: 6 }
    validates :email, uniqueness: true
  
    has_many :clients
    has_secure_password

    private
      def log_new_user
        puts "A new user was registered"
      end
end
  