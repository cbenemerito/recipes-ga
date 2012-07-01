class Recipe < ActiveRecord::Base
  attr_accessible :description, :name, :ingredients_attributes, :recipe_ingredients_attributes

  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients

  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :recipe_ingredients
end
