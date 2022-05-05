class App
  def greetings
    puts '*****************************************'
    puts 'Welcome to the catalog of my things'
    puts '*****************************************'
  end

  def options_list
    puts "Please select 1 option below
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

  def option1(option)
    case option
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
    end
  end

  def option2(option)
    case option
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
    end
  end

  def start
    greetings

    loop do
      options_list
      option = gets.chomp.to_i
      if option.positive? && option < 5
        option1(option)
      elsif option >= 5 && option <= 9
        option2(option)
      else
        puts 'Invalid choice. Please try again'
        break
      end
    end
  end
end
