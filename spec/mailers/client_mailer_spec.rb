require "rails_helper"

RSpec.describe ClientMailer, type: :mailer do
  describe "telegram_link_sender" do
    let(:mail) { ClientMailer.telegram_link_sender }

    it "renders the headers" do
      expect(mail.subject).to eq("Telegram link sender")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
