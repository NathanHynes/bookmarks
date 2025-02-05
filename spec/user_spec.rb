# frozen_string_literal: true

require 'user'
require_relative 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a user' do
      user = User.create(email: 'test@example.com', password: 'secretpassword')

      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'finds a user by id' do
      user = User.create(email: 'test@example.com', password: 'secretpassword')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end

  end
end
