class CapitalizeDecorator < Decorator
  def initialize(namable)
    super(namable)
  end

  def correct_name
    @namable.correct_name.capitalize
  end
end