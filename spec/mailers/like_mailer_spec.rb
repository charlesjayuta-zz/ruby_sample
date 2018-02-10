require 'rails_helper'

RSpec.describe LikeMailer, type: :mailer do
  describe 'like receipt' do
    game = Game.create!(name: 'TestName', year: 'TestYear')
    let(:mail) { LikeMailer.like_receipt(game) }

    it 'renders headers' do
      expect(mail.subject).to eq "#{game.name} was liked!"
      expect(mail.to).to eq ['spam_bot@charlesjay.com']
    end

    it 'renders body' do
      expect(mail.body.encoded).to match game.year.to_s
      expect(mail.body.encoded).to match game.name
      expect(mail.body.encoded).to match game.id.to_s
    end

    game.destroy!
  end
end
