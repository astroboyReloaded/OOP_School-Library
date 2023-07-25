class TrimmerDecorator < Decorator
  def initialize(namable)
    super(namable)
  end

  def correct_name
    @namable.correct_name.slice(0, 10)
  end
end
