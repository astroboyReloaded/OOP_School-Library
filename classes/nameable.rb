class Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    raise NonImplementedError, "#{self.class} has no implemented method '#{__method__}'"
  end
end
