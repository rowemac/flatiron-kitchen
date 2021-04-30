class IngredientsController < ApplicationController
    
    before_action :find_ingredient, only: [:show, :edit, :update]

    def index
        @ingredient = Ingredient.all
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :new
        end
    end 

    def edit 
    end 

    def update
        @ingredient.update(ingredient_params)
        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end 
    end

    def show
    end
    
    private

    def ingredient_params
        params.require(:ingredient).permit(:name, recipe_ids: [])
    end 

    def find_ingredient
        @ingredient = Ingredient.find(params[:id])
    end 
end