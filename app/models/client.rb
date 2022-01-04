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
    self.invitation.coach unless self.invitation.nil?
  end

  def coach_user
    self.coach.user unless self.coach.nil?
  end

  def completed_steps_count(technique)
    count = 0
    technique.steps.each { |step| count += 1 unless CompletedStep.find_by_step_id(step.id).nil?}
    count
  end

  def techniques_completed_count
    count = 0
    self.techniques.each { |technique| count += 1 if self.completed_steps_count(technique) == technique.steps.count }
    count
  end

  def techniques_in_progress_count
    count = 0
    self.techniques.each { |technique| count += 1 if self.completed_steps_count(technique) > 0 and self.completed_steps_count(technique) < technique.steps.count }
    count
  end

  def hours_completed
    count = 0
    self.techniques.each { |technique| count += (technique.duration_start + technique.duration_end) / 2.0 if self.completed_steps_count(technique) == technique.steps.count }
    count
  end

  def hours_in_progress
    count = 0
    self.techniques.each { |technique| count += (technique.duration_start + technique.duration_end) / 2.0 / technique.steps.count * self.completed_steps_count(technique) if self.completed_steps_count(technique) > 0 and self.completed_steps_count(technique) < technique.steps.count }
    count
  end
end
