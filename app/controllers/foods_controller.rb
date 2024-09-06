class FoodsController < ApplicationController
  def index
    @query = params[:q]
    @foods_search = FoodFacade.new

    if params[:q].present?
      @foods = @foods_search.search_foods(@query)
    end
  end
end