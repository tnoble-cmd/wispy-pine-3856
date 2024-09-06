class Food
  attr_reader :gtinUpc,
              :description,
              :brandOwner,
              :ingredients
  def initialize(attributes)
    @gtinUpc = attributes[:gtinUpc]
    @description = attributes[:description]
    @brandOwner = attributes[:brandOwner]
    @ingredients = attributes[:ingredients]
  end
end