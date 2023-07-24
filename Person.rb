class Person
  def initialize (name, age = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def of_age?
    age > 18 ? true : false;
  end

  def can_use_services?
    age >= 18 || parent_permission == true
  end
end