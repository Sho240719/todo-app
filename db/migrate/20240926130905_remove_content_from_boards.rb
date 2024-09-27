class RemoveContentFromBoards < ActiveRecord::Migration[6.0]
  def change
    remove_column :boards, :content, :text
  end
end
