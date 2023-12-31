class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :articles, dependent: :destroy

  validates :username, presence: true, length: {minimum: 3, maximum: 25}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
end
