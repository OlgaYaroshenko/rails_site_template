json.array!(@newsletters) do |newsletter|
  json.extract! newsletter, :to, :blog_id, :status
  json.url newsletter_url(newsletter, format: :json)
end