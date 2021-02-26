Class Cocktail::Drink

attr_reader :drink_selection, :drink_number

def initialize(drink_selection, drink_number)
  @drink_selection = drink_selection
  @drink_number = drink_number
  @instructions = nil
  @complete_hash = {}
  @drink_contents - []
end

def instructions 
  if instructions == nil
    @instructions = get_hash["strMixing_Details"]
  end
  @instructions
end

def contents
  if @contents.empty?
      ingredient_names = get_hash.select { |k, v| k.include?("strIngredient")}.values
      ingredient_quantities = get_hash.select { |k, v| k.include?("strMeasure")}.values
      ingredient_quantities.zip(ingredient_names).each do |quantity, name|
          if name != nil && name.empty? == false
              if quantity != " "
                  @contents << "#{name}: #{quantity}"
              else
                  @scontents << "#{name}"
              end
          end
      end
  end
  @contents
end

def get_hash
  if @complete_hash == {}
      @complete_hash = Cocktail::API.get_drink_detail(@drink_id)
  end
  @complete_hash
end





end