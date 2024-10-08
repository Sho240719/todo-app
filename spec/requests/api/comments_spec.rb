require 'rails_helper'

RSpec.describe 'Api::Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:board) { create(:board, user: user) }
  let!(:task) { create(:task, user: user, board: board) }
  let!(:comment) { create_list(:comment, 3, user: user, task: task) }

  describe 'GET /api/comments' do
    it '200 Status' do
      get api_comments_path(board_id: board.id, task_id: task.id)
      expect(response).to have_http_status(200)
    end
  end
end
