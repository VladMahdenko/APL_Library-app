class ReadersCardsController < ApplicationController
  before_action :set_readers_card, only: %i[ show edit update destroy ]

  # GET /readers_cards or /readers_cards.json
  def index
    @readers_cards = ReadersCardsQuery.call(params, ReadersCard.all)
    @library = params[:library_id]
  end

  # GET /readers_cards/1 or /readers_cards/1.json
  def show
  end

  # GET /readers_cards/new
  def new
    @readers_card = ReadersCard.new
  end

  # GET /readers_cards/1/edit
  def edit
  end

  # POST /readers_cards or /readers_cards.json
  def create
    @readers_card = ReadersCard.new(readers_card_params)

    respond_to do |format|
      if @readers_card.save
        format.html { redirect_to readers_card_url(@readers_card), notice: "Readers card was successfully created." }
        format.json { render :show, status: :created, location: @readers_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @readers_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readers_cards/1 or /readers_cards/1.json
  def update
    respond_to do |format|
      if @readers_card.update(readers_card_params)
        format.html { redirect_to readers_card_url(@readers_card), notice: "Readers card was successfully updated." }
        format.json { render :show, status: :ok, location: @readers_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @readers_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readers_cards/1 or /readers_cards/1.json
  def destroy
    @readers_card.destroy

    respond_to do |format|
      format.html { redirect_to readers_cards_url, notice: "Readers card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_readers_card
      @readers_card = ReadersCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def readers_card_params
      params.require(:readers_card).permit(:issue_date, :library_id)
    end
end
