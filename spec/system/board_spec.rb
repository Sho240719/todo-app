require 'rails_helper'

RSpec.describe 'Board', type: :system do
  it 'ボード一覧が表示される' do
    visit root_path
  end
end
