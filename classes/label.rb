class Label
    attr_accessor :title, :color
    attr_reader :id, :items
  
    def initialize(id: rand(1..1000), title, color = '', items = [] )
      @id = id
      @title = title
      @color = color
      @items = items
  
    end
  
    def add_item(item)
      @items.push(item) unless @items.include?(item)
      item.label = self
    end
  end
  