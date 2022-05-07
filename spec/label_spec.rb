require_relative '../classes/label'

describe Label do
  describe '#new' do
    it 'takes 1-4 arguments and returns a Label object' do
      # ARRANGE
      @label1 = Label.new('label 1')
      @label2 = Label.new('label 1', 'label 2')
      @label3 = Label.new('label 3', 'label 4', [@label1, @label2])
      @label4 = Label.new('label 5', 'label 6', ['label 7', @label3], id: rand(1..1000))
      # ASSERT
      expect(@label1).to be_an_instance_of Label
      expect(@label2).to be_an_instance_of Label
      expect(@label3).to be_an_instance_of Label
      expect(@label4).to be_an_instance_of Label
    end
  end

  describe '#add' do
    it "add_item func takes an item and updates label's items and item's label" do
      # ARRANGE
      @item = Item.new('2010-03-03', false)
      @label = Label.new('label')
      # ACT
      @label.add_item(@item)
      # ASSERT
      expect(@label.items).to include(@item)
      expect(@item.label).to be(@label)
    end
  end
end
