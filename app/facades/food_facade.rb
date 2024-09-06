class FoodFacade
  def search_foods(query)
    foods_data = FoodSearchService.new(query).search_service
    foods_data.map do |food_data|
      Food.new(food_data)
    end
  end
end