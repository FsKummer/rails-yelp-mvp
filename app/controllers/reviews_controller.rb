class ReviewsController < ApplicationController
  before_action :set_restaurant, only:[:new, :create]
  def new
    # We need @restaurant in our `simple_form_for`
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # # esta instância de reviews é criada com erros de validação
    @review = Review.new(review_params)
    # se refere ao restaurante que nos buscamos no metodo before_action
    # aqui associamos nosso restaurante ao nosso review
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
      # UNPROCESSABLE ENTITY
      # indica que o servidor entende o tipo de conteúdo da entidade
      # solicitada e a sintaxe da entidade solicitada está correta,
      # mas não foi capaz de processar as instruções contidas.
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
