RSpec.describe LaughTracksApp do
  before(:each) do
    Comedian.create(name: 'Comedian 1', age: 30)
    Comedian.create(name: 'Comedian 2', age: 40)
  end

  describe 'paths' do
    describe 'GET /comedians' do
      it 'should return a comedians page' do
        visit '/comedians'

        expect(page.status_code).to eq 200
      end
    end
  end
end
