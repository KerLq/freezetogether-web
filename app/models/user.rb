class User < ApplicationRecord
    has_secure_password
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
