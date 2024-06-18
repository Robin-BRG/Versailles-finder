class User < ApplicationRecord
  belongs_to :team, optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
