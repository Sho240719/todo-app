# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_comment_id  (comment_id)
#  index_likes_on_user_id     (user_id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :comment
end
