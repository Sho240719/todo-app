require 'rails_helper'

RSpec.describe 'Api::Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:board) { create(:board, user: user) }
  let!(:task) { create(:task, user: user, board: board) }
  let!(:comments) { create_list(:comment, 3, user: user, task: task) }

  describe 'GET /api/comments' do
    it '200 Status' do
      get api_comments_path(board_id: board.id, task_id: task.id)
      expect(response).to have_http_status(200)

      body = JSON.parse(response.body)
      expect(body.length).to eq 3
      expect(body[0]['content']).to eq comments.first.content
      expect(body[1]['content']).to eq comments.second.content
      expect(body[2]['content']).to eq comments.third.content
    end
  end
end
