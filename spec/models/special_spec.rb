RSpec.describe Special do

  describe 'Validate fields' do
    it 'should have a name' do
      expect(Special.create(comedian_id: 1)).to_not be_valid
    end

    it 'should have an age' do
      expect(Special.create(name: 'Test')).to_not be_valid
    end
  end

  describe 'Relationships' do
    it 'should have a comedian' do
      Comedian.create(name: 'Comedian', age: 30)
      Special.create(name: 'Special', comedian_id: 1)

      expect(Special.first.comedian.id).to eq 1
      expect(Special.first.comedian.name).to eq 'Comedian'
    end
  end

  describe 'CRUD functionality' do
    it 'should be able to create a record' do
      expect(Special.all.length).to eq 0

      Special.create(name: 'Test', comedian_id: 1)
      expect(Special.all.length).to eq 1

      Special.create(name: 'Test 2', comedian_id: 1)
      expect(Special.all.length).to eq 2
    end

    it 'should be able to read a record' do
      Special.create(name: 'Test', comedian_id: 1)
      expect(Special.first.name).to eq 'Test'
    end

    it 'should be able to update a record' do
      Special.create(name: 'Test', comedian_id: 1)
      expect(Special.find(1).name).to eq 'Test'

      Special.find(1).update(name: 'New')
      expect(Special.find(1).name).to eq 'New'
    end

    it 'should be able to delete a record' do
      Special.create(name: 'Test', comedian_id: 1)
      expect(Special.all.length).to eq 1

      Special.first.destroy
      expect(Special.all.length).to eq 0
    end
  end
end
