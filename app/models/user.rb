##
# Represents a User of the application
#
class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :trackable, :timeoutable, :validatable

  attr_accessible :first_name, :last_name, :organization, :email, :password,
                  :password_confirmation

  has_and_belongs_to_many :feed_subscriptions, class_name: FeedCategory

  validates :first_name, presence: true
  validates :last_name, presence: true
end
