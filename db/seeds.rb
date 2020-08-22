# frozen_string_literal: true

# Creation of brands and car_models
brands_and_models = {
  'Renault': ['Clio IV'],
  'Citroën': ['C5']
}

brands_and_models.each do |brand, car_models|
  brand = Brand.where(name: brand).first_or_create
  car_models.each do |car_model|
    brand.car_models.where(name: car_model).first_or_create
  end
end
