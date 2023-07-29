require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom

  def initialize(name, age, classroom = nil)
    super(age, name)
    @classroom = classroom
  end

  def asign_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
