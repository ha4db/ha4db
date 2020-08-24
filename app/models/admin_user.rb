# frozen_string_literal: true

# AdminUser model
class AdminUser < ApplicationRecord
  has_secure_password
  validates :login_name, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password,
            length: { minimum: 8, if: :validate_password? },
            confirmation: { if: :validate_password? }
  validates :password,
            format: {
              with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{2,100}\z/i,
              message: I18n.t('errors.attributes.password.invalid'),
              if: :validate_password?
            }, confirmation: { if: :validate_password? }

  private

  def validate_password?
    password.present? || password_confirmation.present?
  end
end
