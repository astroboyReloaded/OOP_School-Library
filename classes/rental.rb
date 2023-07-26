class Rental
  attr_accessor :date, :book, :person

  initialize(person, date, book)
    @date = date
    @book = book
    @person = person
  end
end
