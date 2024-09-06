require 'rails_helper'

RSpec.describe 'Foods Index Page' do
  before :each do
  
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query%5Bapi_key%5D=BqGfduUOmfFGHIY21VIGYBsgLe4AWD7JpVMnsMrf&query%5BpageSize%5D=10&query%5Bquery%5D=sweet%20potato").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Api-Key'=>'BqGfduUOmfFGHIY21VIGYBsgLe4AWD7JpVMnsMrf',
          'User-Agent'=>'Faraday v2.10.1'
           }).
         to_return(status: 200, body: {
          foods: [
            {gtinUpc: "000000000000", description: "Sweetpotato, raw", brandOwner: "FDC", ingredients: "Sweet potatoes"}
          ]}.to_json, headers: {'Content-Type' => 'application/json'})
  end

  it 'can search for foods' do
    visit '/'

    fill_in :q, with: 'sweet potato'
    click_button 'Search'

    expect(current_path).to eq('/foods')

    expect(page).to have_content('GTIN/UPC: 000000000000')
    expect(page).to have_content('Description: Sweetpotato, raw')
    expect(page).to have_content('Brand Owner: FDC')
    expect(page).to have_content('Ingredients: Sweet potatoes')
  end
end