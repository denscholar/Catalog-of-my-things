require_relative '../classes/genre'
require_relative '../classes/item'
require 'rspec'

describe Genre do
  before(:each) do
    @genre = Genre.new('Pop')
    @item = Item.new('12/05/2018', false)
  end

  context 'Create a new Genre' do
    it 'return a new object' do
      expect(@genre).to be_instance_of(Genre)
    end

    it 'return the correct name for the Genre' do
      expect(@genre.name).to eql('Pop')
    end
  end

  context 'add_item method' do
    it 'Expect Initial items to be empty' do
      expect(@genre.items).to be_empty
    end

    it 'genre should add a new item' do
      @genre.add_item(@item)
      expect(@genre.items).to include(@item)
      expect(@item.genre).to be(@genre)
    end
  end
end

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
