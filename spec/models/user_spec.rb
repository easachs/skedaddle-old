# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    # add associations here
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_uniqueness_of(:uid) }
  end

  describe 'class methods' do
    it '#from_omniauth' do
      response = {
        uid: '123456', info:         { name: 'John Doe',
                                       email: 'johndoe@example.com' }
      }

      user = User.from_omniauth(response)

      expect(User.last.uid).to eq('123456')
      expect(User.last.name).to eq('John Doe')
      expect(User.last.email).to eq('johndoe@example.com')
    end
  end
end
