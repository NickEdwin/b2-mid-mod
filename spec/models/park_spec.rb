RSpec.describe Park do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :admission_price }
  end

  describe 'relationships' do
    it { should have_many :rides }
  end

  describe 'helper method test' do
    it 'uses #avg_thrill_rating to find average thrill rating of all rides' do
    park1 = Park.create({name: "Adventure Land", admission_price: 50})
    ride1 = park1.rides.create({name: "Scream Machine", thrill_rating: 10, park_id: park1.id})
    ride2 = park1.rides.create({name: "Carousel Fun Time", thrill_rating: 5, park_id: park1.id})

    expect(park1.avg_thrill_rating).to eq(7.5)
    end
  end
end
