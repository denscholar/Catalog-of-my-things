require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :name, :title 

  def initialize(title, publisher, cover_state, publish_date)
    super(publish_date, id)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
