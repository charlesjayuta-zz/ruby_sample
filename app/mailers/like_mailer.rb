class LikeMailer < ApplicationMailer
  default from: 'no-reply@charlesjay.com'

  # sends an email receipt for a successful like
  def like_receipt(game)
    @game = game
    mail(to: 'spam_bot@charlesjay.com', subject: "#{game.name} was liked!")
  end
end
