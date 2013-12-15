json.array!(@websites) do |website|
  json.extract! website, :id, :url, :host, :title, :favicon, :sort
  json.url website_url(website, format: :json)
end
