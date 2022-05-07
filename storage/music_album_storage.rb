require_relative '../classes/music_album'
require 'json'

module MusicAlbumData
  def load_music_album
    file = './data/music_album.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |album|
        data.push(MusicAlbum.new(album['publish_date'], album['on_spotify']))
      end
    end
    data
  end

  def save_music_album
    data = []
    @music_albums.each do |album|
      data.push({ publish_date: album.publish_date, on_spotify: album.on_spotify })
    end
    File.write('./data/music_album.json', JSON.generate(data))
  end
end
