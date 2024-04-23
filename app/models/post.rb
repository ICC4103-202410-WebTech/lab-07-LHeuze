class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags
    belongs_to :parent_post, class_name: "Post", optional: true
    has_many :child_posts, class_name: "Post", foreign_key: "parent_post_id"
    
    validates :title, presence: { message: "Title can't be null" }
    validates :content, presence: { message: "Content can't be null" }
    validates :user_id, presence: true
    validates :answers_count, numericality: { greater_than_or_equal_to: 0 }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0 }
    
    after_initialize :set_published_at, if: :new_record?
  
    private
  
    def set_published_at
      self.published_at ||= Time.current
    end
  end
  