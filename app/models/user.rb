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
end
