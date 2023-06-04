class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  def get_image
    # もし、画像がattached（添付）されていない場合は・・・
    unless image.attached?
      # file_path変数にrailsアプリのルートディレクトリからパスを設定する
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      
      # image.attachメソッドを使用して、指定したパスから画像を添付する
      # ioオプションは、ファイルを開いて入力ストリームを作成する
      # filenameオプションは添付される画像のファイル名を指定する
      # content_typeオプションは、添付される画像のコンテンツタイプを指定する
      image.attace(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
