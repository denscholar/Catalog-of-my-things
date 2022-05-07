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
      list_albums
    when 3
      list_games
    when 4
      list_genres
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
      add_new_album
    when 9
      add_new_game
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

  def list_authors
    puts 'There are no @authors yet!' if @music_albums.empty?
    @authors.each do |author|
      puts "First name: #{author.first_name}, last name : #{last.first_name}}"
    end
  end
  
  def list_genres
    puts 'There are no genres yet!' if @genres.empty?
    @genres.each do |genre|
      puts "Genre: #{genre.name}}"
    end
  end

  def add_new_album
    print 'Published Date [Enter date in format (mm-dd-yyy)]: '
    publish_date = gets.chomp
    return unless publish_date

    print "This album is on Spotify [Enter answer in format true / false: "
    on_spotify = gets.chomp.to_s.casecmp('true').zero?

    @music_albums.push(MusicAlbum.new(publish_date, on_spotify))
    save_music_album
    puts 'Album created successfully'
  end

  def list_albums
    puts 'There are no genres yet!' if @music_albums.empty?
    @music_albums.each do |album|
      puts "Publish date: #{album.publish_date}, On Spotify : #{album.on_spotify}}"
    end
  end
end
