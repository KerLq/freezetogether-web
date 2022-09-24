# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :username, length: { maximum: 16 } # Entferne Sonderzeichen und ggf. chinesische Schriftzeichen entfernen
  # validates_length_of :password, minimum: 8 # Groß- und Kleinbuchstaben ggf. + Sonderzeichen
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  before_save :downcase_email
  before_create :confirmation_token, :downcase_email
  # validates :username, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: true
  enum role: { standard: 0, admin: 1 }

  has_many :games
  has_many :accomplished_achievements
  has_one_attached :avatar

  def email_activate
    self.email_confirmed = true
    self.confirm_token   = nil
    save!(validate: false)
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end

  def downcase_email
    email.downcase!
  end
end
