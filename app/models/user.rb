class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :items
  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  # The people who follow us
  has_and_belongs_to_many :followers, class_name: 'User', join_table: :buddies, foreign_key: :followed_id, association_foreign_key: :follower_id

  # The people we follow
  has_and_belongs_to_many :following, class_name: 'User', join_table: :buddies,
  foreign_key: :follower_id, association_foreign_key: :followed_id

  def followed_by?(user)
   followers.exists?(user.id)
  end

  def toggle_followed_by(user)
   # If currently following, we unfollow
    if followers.exists?(user.id)
      followers.destroy(user)
    # If currently not following, we follow
    else
      followers << user
    end
  end

  def buddy_list
    Profile.where(user: self.following).order(created_at: :desc)
  end
end
