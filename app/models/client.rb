class Client < ApplicationRecord
  self.primary_key = "id"

  has_one_attached :image
  validates :age, numericality: { only_integer: true, in: 18..99 }
  validate :bio
  
  belongs_to :user

  belongs_to :gender
  validates :gender, presence: true
  
  has_many :invitations
  has_many :coaches, through: :invitations

  has_many :notifications
  
  has_many :messages
  has_many :coaches, through: :messages

  has_many :completed_steps
  has_many :steps, through: :completed_steps

  has_and_belongs_to_many :problems
  validates :problems, presence: true

  has_and_belongs_to_many :techniques

  def invitation
    self.invitations.where(status: 1).last
  end

  def coach
    self.invitation.coach
  end

  def coach_user
    self.coach.user
  end

  def completed_steps_count(technique)
    count = 0

    technique.steps.each do |step|
      completed_steps = CompletedStep.find_by_step_id(step.id)

      unless completed_steps.nil?
        count += 1
      end
    end

    count
  end
end
