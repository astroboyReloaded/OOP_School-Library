require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'All books:'
    @books.each do |book|
      puts "ID: #{book.id}.- #{book.title} by #{book.author}"
    end
  end

  def list_people
    puts 'All people:'
    @people.each do |person|
      puts "ID: #{person.id}.- #{person.name} (#{person.class})"
    end
  end

  def create_person
    puts 'Enter person name:'
    name = gets.chomp
    puts 'Enter person age:'
    age = gets.chomp.to_i
    puts 'Enter person role:'

    puts '1. Student'
    puts '2. Teacher'
    choice = gets.chomp.to_i

    person_of_type(choice, name, age)
  end

  def person_of_type(choice, name, age)
    case choice
    when 1
      @people.push(Student.new(name, age))
      puts "New student '#{name}' created successfully!"
    when 2
      puts 'Enter teacher specialization'
      specialization = gets.chomp
      @people.push(Teacher.new(name, age, specialization))
      puts "New teacher '#{name}' created successfully!"
    else
      puts 'Invalid choice. Person was not created'
    end
  end

  def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp

    new_book = Book.new(title, author)
    @books << new_book
    puts "New book '#{title}' by #{author} created successfully!"
  end

  def create_rental
    puts 'Enter the ID of the person renting the book:'
    list_people
    renter_id = gets.chomp.to_i
    renter = @people.find { |p| p.id == renter_id }

    if renter.nil?
      puts "Person with ID #{person_id} not found. Rental was not created."
      return
    end

    puts 'Enter the ID of the book being rented:'
    list_books
    book_id = gets.chomp.to_i
    book = @books.find { |b| b.id == book_id }

    if book.nil?
      puts "Book with ID #{book_id} not found. Rental was not created."
      return
    end

    rental = book.add_rental(renter, Time.now)
    @rentals << rental
    puts 'Rental created successfully!'
  end

  def list_rentals_for_person
    puts 'Enter the ID of the person rentals you wish to list:'
    list_people
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    person_rentals = person.rentals

    if person_rentals.empty?
      puts "No rentals found for person with ID #{person_id}."
      return
    end

    puts "Person with ID #{person_id} has the following rentals:"
    person_rentals.each do |rental|
      puts "#{rental.book.title} by #{rental.book.author} - Date: #{rental.date}"
    end
  end

  OPTIONS = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    7 => :exit_app
  }.freeze

  def run
    puts 'Welcome to the Library Management Console App!'
    $stdout.flush

    loop do
      puts "\nPlease choose an option:"
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List all rentals for a given person ID'
      puts '7. Quit'

      choice = gets.chomp.to_i
      run_option(choice)
    end
  end

  def run_option(choice)
    selected_option = OPTIONS[choice]

    if selected_option
      send(selected_option)
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def exit_app
    puts 'Exiting the app...'
    exit(0)
  end
end
