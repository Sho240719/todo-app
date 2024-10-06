require 'rails_helper'

RSpec.describe Board, type: :model do
  context 'タイトルと内容が入力されている場合' do
    before do
      user = User.create!({
        email: 'test@example.com',
        password: 'password'
      })
      @board = user.boards.build({
        title: Faker::Lorem.characters(number: 10),
        content: Faker::Lorem.characters(number: 100)
      })
    end

    it 'ボードを保存できる' do
      expect(@board).to be_valid
    end
  end
end
