# frozen_string_literal: true

# user implement
module UserImplement
  extend ActiveSupport::Concern

  private

  def validate_password?
    password.present? || password_confirmation.present?
  end
end
