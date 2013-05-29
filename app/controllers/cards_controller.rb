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
    redirect_to deck_path(@deck)
  end
  
  def show
    @deck = find_deck
    @card = find_card(@deck)
    @next_card = find_next_card(@deck, @card)
    @previous_card = find_previous_card(@deck, @card)
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
    
    def find_next_card(deck, card)
      deck.cards[deck.cards.index(card) + 1 ]
    end
    
    def find_previous_card(deck, card)
      new_card = deck.cards[deck.cards.index(card) - 1 ]
      if deck.cards.index(new_card) < 0
        return nil
      else
        new_card
      end
    end
end
