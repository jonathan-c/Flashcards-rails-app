class DecksController < ApplicationController
  before_filter :authenticate
  
  def index
    @decks = current_user.decks
  end
  
  def new
    @deck = current_user.decks.new
  end
  
  def show
    @deck = find_deck
    @cards = @deck.cards
  end
  
  def create
    @deck = current_user.decks.new(params[:deck])
    @deck.save
    if @deck.save
      redirect_to deck_path(@deck)
    else
      flash[:alert] = @deck.errors.full_messages
      redirect_to new_deck_path
    end
  end
  
  def edit
    @deck = find_deck
  end
  
  def update
    @deck = find_deck
    @deck.update_attributes(params[:deck])
    # redirect_to @deck <-- Polymorphic path
    redirect_to deck_path(@deck)
  end
  
  def destroy
    @deck = find_deck
    @deck.destroy
    redirect_to decks_path
  end
  
  private
  
    def find_deck
      current_user.decks.find(params[:id])
    end
  
end
