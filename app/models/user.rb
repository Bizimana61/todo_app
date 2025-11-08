class User < ApplicationRecord
  has_secure_password
  has_many :todos, dependent: :destroy

  attr_accessor :reset_token

  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[A-Za-z])(?=.*[@#%$&*\^]).*\z/

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            length: { maximum: 255 }

  validates :name,
            length: { maximum: 100 },
            allow_blank: true

  validates :avatar_url,
            length: { maximum: 500 },
            format: { with: /\A(https?:\/\/)?.+\z/, message: "must be a valid URL" },
            allow_blank: true

  validates :password,
            presence: true,
            format: { with: PASSWORD_FORMAT, message: "must be at least 8 characters, include a letter, a digit and one of these symbols: @ # % $ & * ^" },
            length: { minimum: 8, maximum: 128 },
            if: :password_required?

  # Normalize email to lowercase before saving
  before_save :normalize_email

  # Sanitize user inputs before saving
  before_validation :sanitize_inputs

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

  # Create password reset token and digest
  def create_reset_digest
    self.reset_token = SecureRandom.urlsafe_base64
    update_columns(reset_digest: BCrypt::Password.create(reset_token),
                   reset_sent_at: Time.current)
  end

  # Check if password reset has expired (2 hours)
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # Authenticate reset token
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private

  def normalize_email
    self.email = email.downcase.strip if email.present?
  end

  def sanitize_inputs
    self.name = name.strip if name.present?
    self.email = email.strip if email.present?
    self.avatar_url = avatar_url.strip if avatar_url.present?
  end
end
