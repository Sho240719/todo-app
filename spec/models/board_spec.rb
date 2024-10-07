require 'rails_helper'

RSpec.describe Board, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと内容が入力されている場合' do
    let!(:board) { build(:board, user: user) }

    it 'ボードを保存できる' do
      expect(board).to be_valid
    end
  end

  context 'タイトルの文字が一文字の場合' do
    let!(:board) { build(:board, title: Faker::Lorem.characters(number: 1)) }

    before do
      board.save
    end

    it 'ボードを保存できない' do
      expect(board.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end
