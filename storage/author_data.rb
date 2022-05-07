module AuthorsData
  def read_authors
    data = []
    file = './data/authors.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |author|
        data.push(Author.new(author['first_name'], author['last_name']))
      end
    else
      File.write(file, [])
    end

    data
  end

  def save_author
    data = []
    @music_albums.each do |author|
      data.push({ first_name: author.first_name, last_name: author.last_name })
    end
    open('./data/authors.json', 'w') { |f| f << JSON.generate(data) }
  end
end
