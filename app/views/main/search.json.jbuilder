json.countries do
    json.array!(@countries) do |country|
        json.name country.name
        json.url country_path(country)
    end
end

json.cities do
    json.array!(@cities) do |city|
        json.name city.name
        json.url city_path(city)
    end
end

json.hotels do
    json.array!(@hotels) do |hotel|
        json.name hotel.name
        json.url hotel_path(hotel)
    end
end

json.restaurants do
    json.array!(@restaurants) do |restaurant|
        json.name restaurant.name
        json.url restaurant_path(restaurant)
    end
end
