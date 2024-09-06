class FoodSearchService
  def initialize(query, limit = 10)
    @query = query
    @limit = limit
  end

  def search_service
    conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["api_key"] = Rails.application.credentials.usda[:api_key]
    end

    response = conn.get("/fdc/v1/foods/search") do |req|
      req.params['pageSize'] = @limit
      req.params['query'] = @query
      req.params['api_key'] = Rails.application.credentials.usda[:api_key]
    end
  end
end