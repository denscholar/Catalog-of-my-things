require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  it '@genre should be an instance of Genre class' do
    genre = Genre.new('pop')
    expect(genre).to be_an_instance_of Genre
  end

  it 'genre should add a new item' do
    genre = Genre.new('pop')
    item = Item.new('12/05/2018', false)
    genre.add_item(item)
    expect(item.genre).to be(genre)
  end
end
