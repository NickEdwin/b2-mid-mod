RSpec.describe Mechanic do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :experience }
  end
end
