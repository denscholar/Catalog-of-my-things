class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title = ' ', color = ' ', items = [], id: rand(1..1000))
    @title = title
    @color = color
    @items = items
    @id = id
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.label = self
  end
end
