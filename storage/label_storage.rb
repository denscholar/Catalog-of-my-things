require_relative '../classes/label'
require 'json'
require 'date'

module LabelsData
  def read_labels
    file = './json_files/labels.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Label.new(id: element['id'].to_i, title: element['title'], color: element['color']))
      end
    end
    data
  end

  def save_labels
    data = []
    @labels.each do |label|
      data.push({ id: label.id, title: label.title, color: label.color })
    end
    File.write('./data/labels.json', JSON.generate(data))
  end
end
