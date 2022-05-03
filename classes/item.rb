class Item

    attr_reader :id, :archived
    attr_accessor   :label, :author, :genre, :publish_date,
  
    def initialize(publish_date, archived, id: rand(1..1000))
      @publish_date = publish_date
      @archived = archived
      @id = id
      @author = nil
      @label = nil
      @genre = nil
    end

end