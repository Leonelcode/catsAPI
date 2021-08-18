class CatsController < ApplicationController
  before_action :set_cat, only: %i[show update destroy]

  # GET /dogs
  def index
    @cats = Cat.order(id: :asc)
    json_response(@cats)
  end

  # POST /dogs
  def create
    @cat = Cat.create!(cat_params)
    json_response(@cat, status: :created)
  end

  # GET /cats/:id
  def show
  json_response(@cat)
  end

  # DELETE /cats/:id
  def destroy
    @cat.destroy
    head :no_content
  end

  # PUT /dogs/:id
  def update
    @cat.update(cat_params)
    head :no_content
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :description, :image_url, :breed_id)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end
end  