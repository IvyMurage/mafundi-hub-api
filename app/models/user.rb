class User < ApplicationRecord
  # has_one :client
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         #  :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self
  has_one_attached :avatar
end
