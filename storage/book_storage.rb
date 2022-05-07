require_relative '../classes/book'
require 'json'
require 'date'

module BooksData
  def read_books
    file = './data/books.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Book.new(element['title'], element['publisher'], element['cover_state'], element['published_date']))
      end
    end
    data
  end

  def save_books
    data = []
    @books.each do |book|
      data.push({ title: book.title, publisher: book.publisher, cover_state: book.cover_state,
                  publish_date: book.publish_date })
    end
    File.write('./data/books.json', JSON.generate(data))
  end
end
