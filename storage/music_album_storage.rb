require_relative '../classes/music_album'
require 'json'

module MusicAlbumData
  def load_music_album
    if File.exist?('./data/music_album.json') && File.read('./data/music_album.json') != ''
      JSON.parse(File.read('./data/music_album.json')).each do |album|
        MusicAlbum.new(album['published'], album['archived'],
                       album['spotify'], id: album['id'])
      end
    else
      []
    end
  end

  def save_music_album
    data = []
    @list_albums.each do |album|
      data.push({ genre: album.genre.name, published: album.publish_date,
                  archived: album.archived, spotify: album.on_spotify, id: album.id })
    end
    File.write('./data/music_album.json', JSON.generate(data))
  end
end
