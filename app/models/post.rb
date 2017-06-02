class Post < ActiveRecord::Base
    has_many :comments
    belongs_to :user
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    
    has_attached_file :image, styles: { large: "1200x1200>", medium: "300x300>", thumb: "100x100#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
