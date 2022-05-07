require_relative '../classes/music_album'

describe MusicAlbum do
    context 'when creating a new Music Album' do
      it 'return a new object who is an instance of MusicAlbum class' do
        album = MusicAlbum.new('2010-10-10', true, id: rand(1..1000))
        expect(album).to be_an_instance_of(MusicAlbum)
      end
      it 'music should be archived' do
        album = MusicAlbum.new('2010-10-10', true, id: rand(1..1000))
        expect(album.can_be_archived?).to be(true)
      end
    end
end
