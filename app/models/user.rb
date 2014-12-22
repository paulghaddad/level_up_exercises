class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
  validates :password, length: { minimum: 5 }, allow_blank: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
