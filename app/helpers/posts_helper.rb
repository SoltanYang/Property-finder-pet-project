module PostsHelper

  def post_thumbnail_url post
    post.image.thumb.present? ? post.image.thumb.url : asset_url("property-placeholder.jpg")
  end
end
