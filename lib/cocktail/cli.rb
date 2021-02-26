class Cocktail::CLI
    def call
        puts " \nWelcome to Drinkology, please make your selection of alcohol type below!!!\n "
        puts "                      Tequila     "
        puts "                      Vodka       "
        puts "                      Bourbon     "
        puts "                      Scotch      "
        puts "                      Gin         "
        puts "                      Dark Rum    "
        puts "                      Light Rum   "

        while true 
            puts "Please enter a number (1-7) to choose your alcohol type."
            alcohol_selection = gets.chomp.to_i - 1
            alcohol_selection < 0 || alcohol_selection >= 7 print_error_message : break
        end

        print_break_space
        puts "#{Cocktail::API.alcohol_type[alcohol_selection]} drink options:\n "

        drinks = Cocktail::API.list_drinks(alcohol_type)

        drinks.each_with_index do |drink, index|
            puts "#{index + 1}, #{drink.drink_detail}"
        end

        while true 
            puts " \nPlease enter a number to view the drink ingredients."
            drink_selection = gets.chomp.to_i - 1
            drink_selection < 0 || drink_selection >= 10 ? print_error_message : break
        end

        print_break_space
        puts "Your selection is #{drinks[drink_selection.ingredients}"
        puts " \n - Mixing Instructions - "
        puts "#{drinks[drink_selection].procedure}"
    end

    def print_error_message
        puts " \n***Invalid selection, try again***"
    end
    
    def print_break_space
        puts " \n----\n "
    end
        
end