require 'rails_helper'

RSpec.describe Board, type: :model do
  it 'タイトルと内容が入力されていれば、ボードを保存できる' do
    user = User.create!({
      email: 'test@example.com',
      password: 'password'
    })
    board = user.boards.build({
      title: Faker::Lorem.characters(number: 10),
      content: Faker::Lorem.characters(number: 100)
    })

    expect(board).to be_valid
  end
end
