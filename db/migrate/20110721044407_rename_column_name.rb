class RenameColumnName < ActiveRecord::Migration
  def self.up
    rename_column :kakao_links, :short_url, :encoded_id
  end

  def self.down
    rename_column :kakao_links, :encoded_id, :short_url
  end
end
