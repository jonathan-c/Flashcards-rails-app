class CardsController < ApplicationController
  def new
    @deck = Deck.find(params[:deck_id])
    @card = Card.new
  end
  
  def create
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.new(params[:card])
    @card.save
    redirect_to deck_path(@deck)
  end
  
  def show
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
  end
  
  def edit
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
  end
  
  def update
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
    @card.update_attributes(params[:card])
    redirect_to deck_path(@deck)
  end
  
  def destroy
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
    @card.destroy
    redirect_to deck_path(@deck)
  end
end
