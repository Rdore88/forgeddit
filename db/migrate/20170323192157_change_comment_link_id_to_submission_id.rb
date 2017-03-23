class ChangeCommentLinkIdToSubmissionId < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :link_id, :submission_id
  end
end
