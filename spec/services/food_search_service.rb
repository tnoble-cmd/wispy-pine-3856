require 'rails_helper'

RSpec.describe FoodSearchService do
  it 'exists' do
    food_search_service = FoodSearchService.new('sweet potato')

    expect(food_search_service).to be_a(FoodSearchService)
  end

  it 'only returns 10 results' do
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query%5Bapi_key%5D=BqGfduUOmfFGHIY21VIGYBsgLe4AWD7JpVMnsMrf&query%5BpageSize%5D=10&query%5Bquery%5D=sweet%20potato").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Api-Key'=>'BqGfduUOmfFGHIY21VIGYBsgLe4AWD7JpVMnsMrf',
          'User-Agent'=>'Faraday v2.10.1'
           }).
         to_return(status: 200, body: "", headers: {})
  end

end