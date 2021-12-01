class RecipesController < ApplicationController
    def show
       @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(name: params[:recipe][:name],
                    recipe_type: params[:recipe][:recipe_type],
                    cuisine: params[:recipe][:cuisine],
                    ingredients: params[:recipe][:ingredients],
                    cook_method: params[:recipe][:cook_method],
                    cook_time: params[:recipe][:cook_time]
        )
        if @recipe.save
            return redirect_to recipe_path(@recipe.id)
        end

        render :new 
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])

        @recipe.update(name: params[:recipe][:name], recipe_type: params[:recipe][:recipe_type],
            cuisine: params[:recipe][:cuisine],
            ingredients: params[:recipe][:ingredients],
            cook_method: params[:recipe][:cook_method],
            cook_time: params[:recipe][:cook_time])

        if @recipe.save
            return redirect_to recipe_path(@recipe.id)
        end

        render :edit
    end

    def destroy
        recipe = Recipe.find(params[:id])
        recipe.destroy
        redirect_to root_path
    end
end
