class Genre
  attr_accessor :name, :id
  attr_reader :items

  def initialize(name, id: rand(1..1000))
    @name = name
    @id = id
    @items = []
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.genre = self
  end
end
