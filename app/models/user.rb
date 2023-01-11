# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :games, dependent: :destroy
  has_many :accomplished_achievements, through: :games, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  before_create :confirmation_token, :downcase_email

  validates :username, presence: true, uniqueness: true, length: { maximum: 16 }
  validate :validate_email
  validates :password, length: { minimum: 8 }
  validates :tos, presence: true

  enum role: { standard: 0, admin: 1 }

  def email_activate
    self.email_confirmed = true
    self.confirm_token   = nil
    save!(validate: false)
  end

  def generate_reset_password_token
    self.reset_password_token = SecureRandom.urlsafe_base64.to_s
    save!(validate: false)
  end

  private

  def validate_email
    return if email.present? && email =~ URI::MailTo::EMAIL_REGEXP

    if email.blank? && email != ~URI::MailTo::EMAIL_REGEXP
      errors.add(:email, :blank)
    elsif email.present? && email != ~URI::MailTo::EMAIL_REGEXP
      errors.add(:email, :invalid)
    end
  end

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end

  def downcase_email
    return if email.blank?

    email.downcase!
  end
end
