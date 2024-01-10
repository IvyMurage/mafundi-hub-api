class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         #  :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  has_one :client
  has_one_attached :avatar, dependent: :destroy
  validate :validate_avatar_count, on: :create

  private

  def validate_avatar_count
    if avatar.attached? && avatar.blob.previous_changes["filename"].present?
      errors.add(:base, "User can only have one attached avatar")
    end
  end
end
