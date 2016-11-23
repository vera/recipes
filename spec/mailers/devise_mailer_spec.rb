require "rails_helper"

RSpec.describe Devise::Mailer do
  let(:user) do
    FactoryGirl.create :user
  end

  describe "User sign up" do
    before do
      user
    end

    it "should send one email to user" do
      expect(ActionMailer::Base.deliveries.count).to eq 1
    end

    it "should have been sent to the student" do
      expect(ActionMailer::Base.deliveries.last.to).to eq([user.email])
    end

    it "should be sent from correct email address" do
      expect(ActionMailer::Base.deliveries.last.from).to eq(['please-change-me-at-config-initializers-devise@example.com'])
    end

    it "should have the confirmation instructions in the body" do
      expect(ActionMailer::Base.deliveries.last.body).to have_content('Welcome '+user.email+'! You can confirm your account email through the link below: Confirm my account')
    end

  end
end
