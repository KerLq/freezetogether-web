class User < ApplicationRecord
    has_secure_password
    validates_length_of :username, maximum: 16 # Entferne Sonderzeichen und ggf. chinesische Schriftzeichen entfernen
    validates_length_of :password, minimum: 8 # Groß- und Kleinbuchstaben ggf. + Sonderzeichen 
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

    enum role: [:standard, :admin]

    has_many :scores
end
