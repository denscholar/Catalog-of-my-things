class App
  def greetings
    puts '*****************************************'
    Puts 'Welcome to the catalog of my things'
    puts '*****************************************'
  end

  def options_list
    Puts "Please select 1 option below
            1 - List all books
            2 - List all music albums
            3 - List all games
            4 - List all genres (e.g 'Comedy', 'Thriller')
            5 - List all labels (e.g 'Gift', 'New')
            6 - List all authors (e.g 'Stephan King')
            7 - Add a book
            8 - Add music album
            9 - Add a game"
  end

  def start
    greetings

    loop do
      list_options
      option = gets.chomp.to_i
      case option
      when 1
        puts 'List all books'
      when 2
        puts 'List all music albums'
      when 3
        puts 'List all games'
      when 4
        puts 'List all genres (e.g "Comedy", "Thriller")'
      when 5
        puts 'List all labels (e.g "Gift", "New")'
      when 6
        puts 'List all authors (e.g "Stephan King")'
      when 7
        puts 'Add a book'
      when 8
        puts 'Add music album'
      when 9
        puts 'Add a game'
      else
        break
      end
    end
  end
end
