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

  def save_genres
    data = [{ name: 'Drame' }, { name: 'novel' }, { name: 'sci-fi' }]
    open('./data/genre.json', 'w') { |file| file.write(data.to_json) }
  end
end
