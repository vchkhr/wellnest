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
  validates :email, email: true, uniqueness: true
  has_secure_password
  validates :age, numericality: { only_integer: true, in: 18..99 }

  belongs_to :gender

  has_one_attached :image

  belongs_to :coach, required: false

  has_many :invitations, dependent: :delete_all
  has_many :coaches, through: :invitations
  
  has_many :completed_steps, dependent: :delete_all
  has_many :steps, through: :completed_steps

  has_many :likes, dependent: :delete_all
  has_many :techniques, through: :likes

  has_many :notifications, dependent: :delete_all
  
  has_and_belongs_to_many :problems
  has_and_belongs_to_many :techniques

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
end
