class Gender
  GENDERS = %w(male female).freeze

  def initialize(gender)
    @gender = gender
  end

  def male?
    to_s.eql?('male')
  end

  def female?
    to_s.eql?('female')
  end

  def to_s
    @gender.to_s
  end
end
