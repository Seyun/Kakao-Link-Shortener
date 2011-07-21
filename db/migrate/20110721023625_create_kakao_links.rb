class CreateKakaoLinks < ActiveRecord::Migration
  def self.up
    create_table :kakao_links do |t|
      t.string :original
      t.string :short_url
      t.string :msg
      t.string :appid
      t.string :appver

      t.timestamps
    end
  end

  def self.down
    drop_table :kakao_links
  end
end
