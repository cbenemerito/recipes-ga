class RecipeIngredient < ActiveRecord::Base
  attr_accessible :name, :quantity, :ingredient, :ingredients_attributes, :ingredient_name

  belongs_to :recipe
  belongs_to :ingredient

  def ingredient_name
  	ingredient && ingredient.name
  end

  def ingredient_name=(name)
  	self.ingredient = Ingredient.find_or_create_by_name(name) unless name.blank?
  end

end
