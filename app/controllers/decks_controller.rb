class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end
  
  def show
    @deck = Deck.find(params[:id])
  end
  
  def new
    @deck = Deck.new
  end
  
  def create
    @deck = Deck.new(params[:deck])
    @deck.save
    redirect_to decks_path
  end
  
  def edit
    @deck = Deck.find(params[:id])
  end
  
  def update
    @deck = Deck.find(params[:id])
    @deck.update_attributes(params[:deck])
    # redirect_to @deck <-- Polymorphic path
    redirect_to deck_path(@deck)
  end
  
  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to decks_path
  end
end
