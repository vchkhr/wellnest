class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  self.primary_key = "id"

  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :password, presence: true, confirmation: true
  validate :is_verified

  has_one :client
  has_one :coach
end