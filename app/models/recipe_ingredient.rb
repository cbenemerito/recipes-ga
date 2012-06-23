class RecipeIngredient < ActiveRecord::Base
  attr_accessible :name, :quantity

  belongs_to :recipe
  belongs_to :ingredient
end
