class Recipe < ActiveRecord::Base
  attr_accessible :description, :name, :ingredients_attributes, :recipe_ingredients_attributes

  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients

  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :recipe_ingredients, :reject_if => :all_blank

  validates :name, :presence => true, :uniqueness => { :message => "A recipe with that name already exists. Please use a different name." }
end
