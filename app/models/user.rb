class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :requests
  has_many :reviews, :through => :requests

  has_many :outgoing_requests, foreign_key: "user_id", class_name: "Request"

  has_many :instruments
  has_many :requests, through: :instruments

end
