# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validate :image_check

  private

  def image_check
    return if avatar.image?

    errors.add(:avatar, I18n.t('errors.messages.content_type_invalid'))
  end
end
