require_relative 'classroom.rb'

class Student < Person
  attr_reader :classroom

  def initialize(id, name, age, classroom = nil)
    super(id, name, age)
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
