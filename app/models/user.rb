class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :order

  before_validation :make_first_user_admin

  def make_first_user_admin
    self.admin = User.all.count == 0 && self.admin == nil ? true : self.admin 
  end
end
