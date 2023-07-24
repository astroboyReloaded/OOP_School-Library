class Teacher < Person
  def initialize(id, name, age, specialization)
    super(id, name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
