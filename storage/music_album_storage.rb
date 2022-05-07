require_relative '../classes/music_album'
require 'json'

module MusicAlbumData
  def load_music_album
    if File.exist?('./data/music_album.json') && File.read('./data/music_album.json') != ''
      JSON.parse(File.read('./data/music_album.json')).each do |album|
        MusicAlbum.new(album['published'], album['spotify'])
      end
    else
      []
    end
  end

  def save_music_album
    data = []
    @music_albums.each do |album|
      data.push({ published: album.publish_date, spotify: album.on_spotify, })
    end
    File.write('./data/music_album.json', JSON.generate(data))
  end
end
