class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, :dependent => :destroy
  validates :name, presence: { message: ' cannot be empty!' },
                    length: { minimum: 3, message: ' must be at least 3 characters long' }
end
