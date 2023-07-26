require_relative 'rental.rb'
require_relative 'person.rb'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(person, date, self)
    @rentals.push(rental)
    person.add_rental(rental)
  end
end
