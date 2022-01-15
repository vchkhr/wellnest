class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class Coach < ApplicationRecord
  self.primary_key = "id"

  validates :name, presence: true
  validates :email, email: true, uniqueness: true
  has_secure_password
  validates :age, numericality: { only_integer: true, in: 18..99 }

  enum gender: Gender::GENDERS

  has_one_attached :image

  validates :education, presence: true
  validates :work, presence: true
  validates :licenses, presence: true
  validates :links, presence: true
  validates :problems, presence: true

  has_many :users

  has_many :invitations, dependent: :delete_all
  has_many :users, through: :invitations
  
  has_many :coach_notifications, dependent: :delete_all

  has_and_belongs_to_many :problems

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

  def gender
    @gender ||= Gender.new(read_attribute(:gender))
  end
end
