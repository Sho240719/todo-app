# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :text
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
  validates :content, presence: true
  validates :content, length: { minimum: 10 }

  belongs_to :user
  has_many :tasks, dependent: :destroy

  def show_name
    self.user.email.split('@').first
  end

  def display_updated_at
    I18n.l(self.updated_at, format: :default)
  end

end
