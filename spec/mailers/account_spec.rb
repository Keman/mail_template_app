require 'rails_helper'

RSpec.describe AccountMailer, :type => :mailer do
  describe '#notify' do
    let(:first_account) { Account.create(email: "ivan@mail.com", name: "Ivan", balance: 10, currency: "USD") }
    let(:second_account) { Account.create(email: "fedor@mail.com", name: "Fedor", balance: 20, currency: "USD") }
    let(:message) { Message.create(title: "Test", text: "Здравствуйте, {{name}}. Ваш баланс: {{balance}}{{currency}}") }
    let(:first_mail) { AccountMailer.notify(message, first_account) }
    let(:second_mail) { AccountMailer.notify(message, second_account) }

    def text_for_matching(account)
      "Здравствуйте, #{account.name}. Ваш баланс: #{account.balance.to_s + account.currency}"
    end

    it "should parse account and render correct text for email (first_account)" do
      expect(first_mail.subject).to eq(message.title)
      expect(first_mail.body).to match(text_for_matching(first_account))
    end

    it "should parse account and render correct text for email (second_account)" do
      expect(second_mail.subject).to eq(message.title)
      expect(second_mail.body).to match(text_for_matching(second_account))
    end
  end
end
