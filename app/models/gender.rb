class Gender
  GENDERS = %w(male female both).freeze

  def initialize(gender)
    @gender = gender
  end
  
  def to_s
    @gender.to_s
  end
end
