class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, uniqueness: { case_sensitive: true } 
  has_many :statuses
  has_many :messages
  # Making Friends ---------------------
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  # Making Friends --------------------- 
  

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", 
  micro: "40x40>" }, 
  default_url: "https://s3.amazonaws.com/socialville/:attachment/missing_:style.jpg"  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/   
  
  has_attached_file :cover, styles: { cover: "700x300>", preview: "230x100>" }, 
  default_url: "https://s3.amazonaws.com/socialville/:attachment/missing_:style.jpg"  
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/ 
  

  
   # Making Friends ---------------------
  
  def request_friendship(user_2)
  	self.friendships.create(friend: user_2)
  end
  
  def pending_friend_requests_from
    self.inverse_friendships.where(friend_status: "pending")
  end
  
  def pending_friend_requests_to
    self.friendships.where(friend_status: "pending")
  end
  
  def active_friends
    self.friendships.where(friend_status: "active").map(&:friend) + self.inverse_friendships.where(friend_status: "active").map(&:user)
  end
  
    def friendship_status(user_2)
    friendship = Friendship.where(user_id: [self.id,user_2.id], friend_id: [self.id,user_2.id])
    unless friendship.any?
      return "not_friends"
    else
      if friendship.first.friend_status == "active"
        return "friends"
      else
        if friendship.first.user == self
          return "pending"
        else
          return "requested"
        end
      end
    end
  end
  
  def friendship_relation(user_2)
    Friendship.where(user_id: [self.id,user_2.id], friend_id: [self.id,user_2.id]).first
  end
  # Making Friends ---------------------
  
  def twitter_model
    if self.twitter_permission == true && self.twitter.present?
      return self.twitter
    else
      return "Ask Me!"
    end
  end
  
    def facebook_model
    if self.facebook_permission == true && self.facebook.present?
      return self.facebook
    else
      return "Ask Me!"
    end
  end
  
    def youtube_model
    if self.youtube_permission == true && self.youtube.present?
      return self.youtube
    else
      return "Ask Me!"
    end
  end
  
    def birthday_model
    if self.age.present?
      return self.age.strftime('%B %e, %Y')
    else
      return "Wanna buy me a gift?"
    end
  end
  
  def location_model
    if self.location.present?
      return self.location
    else
      return "No location set"
    end 
  end
  
  def email_model
    if self.email_permission == true
      return self.email
    elsif self.alt_email.present? && self.email_permission == false
      return self.alt_email
    else
      return "I don't share my email"
    end 
  end
end


