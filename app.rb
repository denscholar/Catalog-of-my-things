require_relative 'classes/author'
require_relative 'classes/book'
require_relative 'classes/game'
require_relative 'classes/genre'
require_relative 'classes/item'
require_relative 'classes/label'
require_relative 'classes/music_album'
require_relative 'storage/author_data'
require_relative 'storage/book_storage'
require_relative 'storage/game_data'
require_relative 'storage/genre_storage'
require_relative 'storage/label_storage'
require_relative 'storage/music_album_storage'

class App
  include AuthorsData
  include BooksData
  include GameData
  include GenreData
  include LabelsData
  include MusicAlbumData

  def initialize
    @games = read_games
    @books = read_books
    @labels = read_labels
    @authors = read_authors
    @genres = load_genres
    @music_albums = load_music_album
  end

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
            9 - Add a game
            To exit press any other key"
  end

  def option1(option)
    case option
    when 1
      list_books
    when 2
      puts 'List all music albums'
    when 3
      puts 'List all games'
    when 4
      puts "List all genres (e.g 'Comedy', 'Thriller')"
    end
  end

  def option2(option)
    case option
    when 5
      list_labels
    when 6
      puts "List all authors (e.g 'Stephan King')"
    when 7
      add_new_book
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

  def list_games
    puts 'There are no gamess yet!' if @games.empty?
    @games.each do |game|
      puts "Multiplayer : #{game.multiplayer},
      last date played : #{game.last_played_at},
      publishing : #{game.publish_date}"
    end
  end

  def add_new_game
    print "It is a multiplayer game: "
    multiplayer = gets.chomp.to_s.casecmp('true').zero?

    print "Please, enter the last date the game was played (mm-dd-yyy)"
    last_played_at, = gets.chomp

    print 'Published Date [Enter date in format (mm-dd-yyy)]: '
    publish_date = gets.chomp
    return unless publish_date

    @games.push(Game.new(multiplayer, last_played_at, publish_date))
    save_games(@games)
    puts 'Game created successfully'
  end

  def list_books
    puts 'There are no books yet! Please add books.' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Publish Date: #{book.publish_date}, cover_state: #{book.cover_state}"
    end
  end

  def list_labels
    puts 'There are no labels yet!' if @labels.empty?
    @labels.each do |label|
      puts "ID: #{label['id']}, Title: #{label['title']}, Color: #{label['color']}"
    end
  end

  def list_genress
    puts 'There are no genres yet!' if @genres.empty?
    @genres.each do |genre|
      puts "Genre: #{genre['name']}}"
    end
  end

  def add_new_book
    print "Please, enter the book's title: "
    title = gets.chomp

    print "Please, enter the book's publisher: "
    publisher = gets.chomp

    print "Please, enter the book's cover state: "
    cover_state = gets.chomp

    print 'Published Date [Enter date in format (mm-dd-yyy)]: '
    publish_date = gets.chomp
    return unless publish_date

    @books.push(Book.new(title, publisher, cover_state, publish_date))
    save_books
    puts 'Book created successfully'
  end
end
