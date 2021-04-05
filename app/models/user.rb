class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50 }

  attachment :profile_image, destroy: false

  has_many :books, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :active_relationships, class_name:"Relationship", foreign_key:"follower_id",dependent: :destroy
  has_many :passive_relationships, class_name:"Relationship", foreign_key:"followed_id",dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :followings, through: :active_relationships, source: :followed

  # def follow(other_user)
  #   unless self == other_user
  #     self.relationships.find_or_create_by(followed_id: other_user.id)
  #   end
  # end

  def followed_by?(user)
  passive_relationships.find_by(follower_id: user.id).present?
  end



end
