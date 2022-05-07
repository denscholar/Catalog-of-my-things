require_relative '../classes/genre'
require 'json'

module GenreData
  def load_genres
    if File.exist?('./data/genre.json') && File.read('./data/genre.json') != ''
      JSON.parse(File.read('./data/genre.json')).each do |genre|
        Genre.new(genre['name'])
      end
    else
      []
    end
  end

  def save_genre
    data = []
    @music_albums.each do |genre|
      data.push({ id: genre.id, name: genre.name })
    end
    open('./json_files/genre.json', 'w') { |f| f << JSON.generate(data) }
  end
end
