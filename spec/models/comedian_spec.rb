RSpec.describe Comedian do

  describe 'Validate fields' do
    it 'should have a name' do
      expect(Comedian.create(age: 30)).to_not be_valid
    end

    it 'should have an age' do
      expect(Comedian.create(name: 'Test')).to_not be_valid
    end
  end

  describe 'Relationships' do
    it 'should have specials' do
    end
  end

  describe 'CRUD functionality' do
    it 'should be able to create a record' do
      expect(Comedian.all.length).to eq 0

      Comedian.create(name: 'Test', age: 30)
      expect(Comedian.all.length).to eq 1

      Comedian.create(name: 'Test 2', age: 30)
      expect(Comedian.all.length).to eq 2
    end

    it 'should be able to read a record' do
      Comedian.create(name: 'Test', age: 30)
      expect(Comedian.first.name).to eq 'Test'
    end

    it 'should be able to update a record' do
      Comedian.create(name: 'Test', age: 30)
      expect(Comedian.find(1).name).to eq 'Test'

      Comedian.find(1).update(name: 'New')
      expect(Comedian.find(1).name).to eq 'New'
    end

    it 'should be able to delete a record' do
      Comedian.create(name: 'Test', age: 30)
      expect(Comedian.all.length).to eq 1

      Comedian.first.destroy
      expect(Comedian.all.length).to eq 0
    end
  end
end
