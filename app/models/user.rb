class User < ApplicationRecord
  extend Devise::Models
  has_and_belongs_to_many :workouts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         include DeviseTokenAuth::Concerns::User
end
