require_relative '../classes/music_album'

describe MusicAlbum do
  before(:each) do
    @album = MusicAlbum.new('2010-10-10', true, true)
  end

  context 'Create a new Music Album' do
    it 'return a new object' do
      expect(@album).to be_instance_of(MusicAlbum)
    end
  end

  it 'expect can_be_archive? method return true' do
    expect(@album.can_be_archived?).to be(true)
  end
end
