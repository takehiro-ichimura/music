module ApplicationHelper
  def default_meta_tags
    {
      title:       "オトハブ|誰でも音楽レビューできるSNS。音楽ブログの宣伝にも。",
      description: "オトハブでは音楽レビューを誰でもかけます。有名なアーティストから自作アルバムまで、熱いレビューをお待ちしています。
      また、音楽ブログを運営している方はリンクを貼って宣伝していただけます。",
      keywords:    "音楽,ブログ,レビュー,ロック,HIPHOP",
      iicon: [
        { href: image_url('favicon.ico') },
        { href: image_url('favicon.ico'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      noindex: ! Rails.env.production?, # production環境以外はnoindex  
      charset: "UTF-8",
      # OGPの設定
      og: {
        title: :title,
        type: "website",
        url: request.original_url,
        image: image_url("otohub.jpg"),
        site_name: "オトハブ",
        description: :description,
        locale: "ja_JP"
      } 
    }
  end
end
