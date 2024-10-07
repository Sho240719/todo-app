# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { minimum: 2, maximum: 100  }
  validates :content, presence: true

  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_rich_text :content
end
