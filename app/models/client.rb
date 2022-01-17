class Client < ApplicationRecord
  self.primary_key = "id"

  validates :age, numericality: { only_integer: true, in: 18..99 }
  validates :problems, presence: true
  as_enum :gender, female: 1, male: 0

  has_one_attached :image
  
  has_many :invitations, dependent: :delete_all
  has_many :coaches, through: :invitations
  
  has_many :messages, dependent: :delete_all
  has_many :coaches, through: :messages

  has_many :completed_steps, dependent: :delete_all
  has_many :steps, through: :completed_steps

  has_many :likes, dependent: :delete_all
  has_many :techniques, through: :likes

  has_many :notifications, dependent: :delete_all
  
  belongs_to :user

  has_and_belongs_to_many :problems
  has_and_belongs_to_many :techniques

  def name
    self.user.name
  end

  scope :where_coach, ->(coach) { find_by_sql(["SELECT clients.id, clients.user_id, clients.age, clients.gender_cd, clients.current_progress FROM (SELECT * FROM invitations WHERE status=1 AND coach_id=?) AS a INNER JOIN clients ON a.client_id = clients.id", coach.id]) }
end
