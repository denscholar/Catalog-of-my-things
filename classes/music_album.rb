require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, archived, on_spotify, id: rand(1..1000))
    super(publish_date, archived, id: id)
    @on_spotify = on_spotify
  end
  
  def can_be_archived?
    super && @on_spotify
  end
end
