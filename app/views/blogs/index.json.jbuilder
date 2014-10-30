json.array!(@blogs) do |blog|
  json.extract! blog, :title, :content, :language
  json.url blog_url(blog, format: :json)
end