require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end

  context 'associations' do
    it { should belong_to(:user) }
  end
end
