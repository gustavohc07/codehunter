class Headhunter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs
  has_many :applications, through: :jobs
  has_many :candidates, through: :applications
  has_many :proposals
end
