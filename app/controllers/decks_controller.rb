class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_deck_ownership!, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :txt

  # GET /decks
  # GET /decks.json
  def index
    @decks = Deck.all
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
    respond_with @deck
  end

  # GET /decks/new
  def new
    @deck = Deck.new.tap do |deck|
      deck.text = Text.new
    end
  end

  # GET /decks/1/edit
  def edit
  end

  # POST /decks
  # POST /decks.json
  def create
    @deck = current_user.decks.build
    @text = Text.new(deck_params[:text_attributes])
    @deck.text = @text

    respond_to do |format|
      if @deck.save
        format.html { redirect_to card_builder_for_deck_and_text_line_path(@deck, 1), notice: 'Deck was successfully created.' }
        format.json { render action: 'show', status: :created, location: @deck }
      else
        format.html { render action: 'new' }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @deck }
      else
        format.html { render action: 'edit' }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_deck
    @deck = Deck.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def deck_params
    params.require(:deck).permit(text_attributes: [:name, :artist, :episode, :raw])
  end

  def check_deck_ownership!
    redirect_to decks_path unless @deck.user.id == current_user.id
  end
end
