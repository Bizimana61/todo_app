class User < ApplicationRecord
  has_secure_password
  has_many :todos, dependent: :destroy

  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[A-Za-z])(?=.*[@#%$&*\^]).*\z/

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            presence: true,
            format: { with: PASSWORD_FORMAT, message: "must be at least 8 characters, include a letter, a digit and one of these symbols: @ # % $ & * ^" },
            if: :password_required?

  def password_required?
    new_record? || !password.nil?
  end

  # Return user initials for avatar fallback
  def initials
    if name.present?
      name.split.map(&:first).join.upcase[0..1]
    else
      email[0].upcase
    end
  end

  # Return avatar URL or nil
  def avatar
    avatar_url.presence
  end
end