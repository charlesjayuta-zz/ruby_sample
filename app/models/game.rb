class Game < ApplicationRecord
  has_attached_file :image
  validates_attachment :image, content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  }

  attr_accessor :image_url

  # create like, email receipt (return true on success, false on fail)
  def like(ip_address)
    # prevent duplicate likes
    recently_liked = Like.where(game_id: id,
                                ip_address: ip_address,
                                created_at: 5.minutes.ago..Time.now).exists?

    unless recently_liked
      # create a like
      Like.create(game_id: id, ip_address: ip_address)

      # increment total like counter
      increment!(:likes)

      # email receipt for like
      LikeMailer.like_receipt(self).deliver_later

      return true
    end

    false
  end
end
