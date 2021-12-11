class User < ApplicationRecord
    has_secure_password
    validates_length_of :username, maximum: 16
    validates_length_of :password, minimum: 8 
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
