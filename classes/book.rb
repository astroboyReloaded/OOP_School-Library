require_relative 'rental'
require_relative 'person'

class Book
  attr_accessor :title, :author
  attr_reader :rentals, :id

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(person, date, self)
    @rentals.push(rental)
    person.add_rental(rental)
    rental
  end
end
