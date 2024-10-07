require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  let! (:user) { create(:user) }
  let! (:boards) { create_list(:board, 3, user: user) }

  describe 'GET /boards' do
    it '200ステータスが返ってくる' do
      get boards_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /boards' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it 'ボードが保存される' do
        board_params = attributes_for(:board)
        post boards_path({board: board_params})
        expect(response).to have_http_status(302)
        expect(Board.last.title).to eq(board_params[:title])
        expect(Board.last.content.body.to_plain_text).to eq(board_params[:content])
      end
    end
  end
end
