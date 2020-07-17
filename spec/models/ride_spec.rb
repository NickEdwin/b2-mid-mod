RSpec.describe Ride do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :thrill_rating }
  end

  describe 'relationships' do
    it { should belong_to :park }
  end
end
