class Decorator < Nameable
  def initialize(namable)
    @namable = namable
  end

  def correct_name
    @namable.correct_name
  end
end