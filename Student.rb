class Student > Person
  def initialize(id, name, age, classroom)
    super(id, name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end