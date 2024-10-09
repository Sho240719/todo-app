require 'rails_helper'

RSpec.describe 'Board', type: :system do
  let!(:user) { create(:user) }
  let!(:boards) { create_list(:board, 3, user: user) }

  it 'ボード一覧が表示される' do
    visit root_path

    boards.each do |board|
      expect(page).to have_css('.board', text: board.title)
    end
  end

  it '記事詳細を表示できる' do
    visit root_path

    board = boards.first
    click_on board.title

    expect(page).to have_css('.headline', text: board.title)
    expect(page).to have_css('.container', text: board.content.to_plain_text)
  end
end
