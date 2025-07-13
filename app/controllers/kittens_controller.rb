class KittensController < ApplicationController
  before_action :find_kitten, only: %i[show edit update destroy]

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    return unless @kitten.save

    redirect_to root_path
  end

  def index
    @kittens = Kitten.all
  end

  def show
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: 'you have sucessfully updated the kitten!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    Kitten.destroy(params[:id])
    redirect_to kittens_path
  end

  private

  def find_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.expect(kitten: %i[name age cuteness softness])
  end
end
