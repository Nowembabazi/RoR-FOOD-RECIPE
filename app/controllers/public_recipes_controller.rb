class PublicRecipesController < ApplicationController
  load_and_authorize_resource
  def index
    @recipes = Recipe.where('public = ? OR user_id = ?', true, current_user.id)
  end
end
