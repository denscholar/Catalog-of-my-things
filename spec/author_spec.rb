require_relative '../classes/author'
require 'yaml'

describe 'Author' do
  context 'when create a new author' do
    it 'return a new object' do
      author = Author.new('Dennis', 'Akagha')
      expect(author).to be_an_instance_of(Author)
    end

    it 'return the correct first and last name' do
      author = Author.new('Dennis', 'Akagha')
      expect(author.first_name).to eql('Dennis')
      expect(author.last_name).to eql('Akagha')
    end
  end

  context 'add_item method' do
    it 'should be able to add an item' do
      author = Author.new('Dennis', 'Akagha')
      item = Item.new('12/05/2018', false)
      author.add_item(item)
      expect(author.items).to include(item)
      expect(item.author).to be(author)
    end
  end
end
