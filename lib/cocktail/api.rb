require 'pry'
require 'httparty'
require_relative './cocktail' #reads from another class in this case calls drinks

class Cocktail::API

    @@url = "https://www.thecocktaildb.com/api/json/v1/1/"

    @@alcohol_type = ['Tequila', 'Vodka', 'Bourbon', 'Scotch', 'Gin', 'Dark_Rum', 'Light_Rum']

    def self.alcohol_type
        @@alcohol_type
    end
    
    def self.drink_list(list_number)
        menu_list = []
        HTTParty.get("#{@@url}filter.php?c=" + alcohol_type[list_number])["drinks"].take(10).each do |drink_detail|
            menu_list << Cocktail::Drink.new(drink_details["idDrink"], drink_detail["strDrink"])
        end
        menu_list
    end

    def self.get_drink_detail(drink_id)
        HTTParty.get("#{@@url}lookup.php?i=" drink_id.to_s).values[0][0]
    end
    binding pry
end

















        def self.list_meals(protein_number)
            tmp_meals = []
            HTTParty.get("#{@@url}filter.php?c=" + protein_options[protein_number])["meals"].take(15).each do |meal_info|
                tmp_meals << Cenar::Meal.new(meal_info["idMeal"], meal_info["strMeal"])
            end
            tmp_meals
        end
    
        # Given a meal_choice, this returns a meal_id hash
        def self.get_meal_info(meal_id)
            HTTParty.get("#{@@url}lookup.php?i=" + meal_id.to_s).values[0][0]
        end
    end






   

