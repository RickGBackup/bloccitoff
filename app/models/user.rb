class User < ActiveRecord::Base
  before_save { self.name = name.titleize if name.present? }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:confirmable  - stub confirmable out for ease of testing new users
         
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
end
