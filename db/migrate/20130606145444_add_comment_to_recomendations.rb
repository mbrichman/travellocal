class AddCommentToRecomendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :comment, :string
  end
end
