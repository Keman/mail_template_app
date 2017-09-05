class Account < ApplicationRecord
  validates :email, :name, :balance, :currency, presence: true
end
