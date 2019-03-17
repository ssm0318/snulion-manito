class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  # Relationship
  has_one :manitee_relationship, :class_name => 'Relationship', :foreign_key => "manito_id", dependent: :destroy
  has_one :manitee, :through => :manitee_relationship, dependent: :destroy

  has_one :manito_relationship, :class_name => 'Relationship', :foreign_key => "manitee_id", dependent: :destroy
  has_one :manito, :through => :manito_relationship, dependent: :destroy
end
