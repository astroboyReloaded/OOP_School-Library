class Rental
  attr_accessor :date, :book, :person

  def initialize(person, date, book)
    @date = date
    @book = book
    @person = person
  end
end
