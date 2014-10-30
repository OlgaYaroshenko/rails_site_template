json.array!(@partners) do |partner|
  json.extract! partner, :name, :site, :visible, :type, :country
  json.url partner_url(partner, format: :json)
end