class AddUrlToKakaoLink < ActiveRecord::Migration
  def self.up
    add_column :kakao_links, :url, :string
  end

  def self.down
    remove_column :kakao_links, :url
  end
end
