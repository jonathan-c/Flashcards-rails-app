class CardsController < ApplicationController
  before_filter :authenticate
  
  def new
    @deck = find_deck
    @card = @deck.cards.new
  end
  
  def create
    @deck = find_deck
    @card = @deck.cards.new(params[:card])
    @card.save
    if @card.save
      redirect_to deck_path(@deck)
    else
      flash[:alert] = @card.errors.full_messages
      redirect_to new_deck_card_path            
    end
  end
  
  def show
    @deck = find_deck
    @card = find_card(@deck)
    @cards = @deck.cards.paginate(:page => params[:page], :per_page => 1)
  end
  
  def edit
    @deck = find_deck
    @card = find_card(@deck)
  end
  
  def update
    @deck = find_deck
    @card = find_card(@deck)
    @card.update_attributes(params[:card])
    redirect_to deck_path(@deck)
  end
  
  def destroy
    @deck = find_deck
    @card = find_card(@deck)
    @card.destroy
    redirect_to deck_path(@deck)
  end
  
  private
  
    def find_deck
     current_user.decks.find(params[:deck_id])
    end
    
    def find_card(deck)
      deck.cards.find(params[:id])
    end
end
