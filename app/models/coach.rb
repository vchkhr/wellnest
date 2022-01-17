class Coach < ApplicationRecord
  self.primary_key = "id"

  validates :age, numericality: { only_integer: true, in: 18..99 }
  validates :education, presence: true
  validates :work, presence: true
  validates :licenses, presence: true
  validates :links, presence: true
  validates :problems, presence: true
  as_enum :gender, female: 1, male: 0
  
  has_one_attached :image

  has_many :invitations, dependent: :delete_all
  has_many :clients, through: :invitations
  
  has_many :messages, dependent: :delete_all
  has_many :clients, through: :messages

  has_many :coach_notifications, dependent: :delete_all

  belongs_to :user

  has_and_belongs_to_many :problems

  def name
    self.user.name
  end

  scope :for_client, ->(client) { find_by_sql(["SELECT coaches.id, coaches.user_id, coaches.bio, coaches.age, coaches.education, coaches.work, coaches.links, coaches.licenses, coaches.gender_cd, coaches.likes_count, coaches.active_clients_count FROM (SELECT * FROM invitations WHERE client_id=? AND status=1 ORDER BY ID DESC LIMIT 1) AS a INNER JOIN coaches ON a.coach_id = coaches.id ORDER BY ID DESC LIMIT 1", client.id]) }

  scope :unconfirmed, ->(client) { find_by_sql(["SELECT coaches.id, coaches.user_id, coaches.bio, coaches.age, coaches.education, coaches.work, coaches.links, coaches.licenses, coaches.gender_cd FROM (SELECT * FROM invitations WHERE client_id=? AND status=0 ORDER BY ID DESC LIMIT 1) AS a INNER JOIN coaches ON a.coach_id = coaches.id ORDER BY ID DESC LIMIT 1", client.id]) }
end
