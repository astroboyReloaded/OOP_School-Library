class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    super(name)
  end

  attr_accessor :name, :age
  attr_reader :id

  def correct_name
    @name
  end

  def of_age?
    age >= 18
  end

  def can_use_services?
    parent_permission == true || of_age?
  end
end
