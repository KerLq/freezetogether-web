class User < ApplicationRecord
    has_secure_password
    validates_length_of :username, maximum: 16 # Entferne Sonderzeichen und ggf. chinesische Schriftzeichen entfernen
    # validates_length_of :password, minimum: 8 # Groß- und Kleinbuchstaben ggf. + Sonderzeichen 
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
    before_create :confirmation_token, :downcase_email
    before_save :downcase_email
    # validates :username, presence: true, uniqueness: true
    # validates :email, presence: true, uniqueness: true
    enum role: [:standard, :admin]

    has_one_attached :avatar
    has_many :scores

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end

    private
    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end

    def downcase_email
        self.email.downcase!
    end
end
