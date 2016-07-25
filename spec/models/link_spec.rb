require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:title) }

    it 'should not validate bad urls' do
      link = Link.new("title" => "won't work", "url" => "invalid")
      expect(link.valid?).not_to eql(true)
    end

    it 'should validate good urls' do
      link = Link.new("title" => "will work", "url" => "http://amazon.com")
      expect(link.valid?).to eql(true)
    end
  end

  context 'associations' do
    it { should belong_to(:user) }
  end
end
