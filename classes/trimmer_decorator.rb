class TrimmerDecorator < Decorator
  def correct_name
    @namable.correct_name.slice(0, 10)
  end
end
