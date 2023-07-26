class Person < Nameable
  attr_accessor :name, :age, :parent_permission
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
    super(name)
  end
  
  def correct_name
    @name
  end

  def of_age?
    age >= 18
  end

  def can_use_services?
    parent_permission == true || of_age?
  end

  def add_rental(rental)
    if can_use_services?
      @rentals.push(rental)
    else
      raise NotImplementedError, 'This user is not allowed to use services'
  end
end
