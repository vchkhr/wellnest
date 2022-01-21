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
  validates :email, presence: true, email: true, uniqueness: true
  
  has_secure_password

  has_one :client, dependent: :delete
  has_one :coach, dependent: :delete

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_password(self).deliver
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def profile
    self.client.nil? ? self.coach : self.client
  end
end
