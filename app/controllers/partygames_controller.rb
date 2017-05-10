class PartygamesController < ApplicationController
	before_action :set_partygame, only: [:show, :edit, :update, :destroy]

	def show
	end

	def new
		@partygame = Partygame.new
		@lanparties = Lanparty.all - current_user.lanparties
	end

	def create
		@partygame = Partygame.new(partygame_params)
		@partygame.user = current_user
		respond_to do |format|
      if not current_user.lanparties.include?  @partygame.lanparty and @partygame.save
        format.html { redirect_to @participant.lanparty, notice: "#{current_user.username}, welcome to the party!" }
        format.json { render :show, status: :created, location: @participant }
      else
        @lanparties = Lanparty.all - current_user.lanparties 
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end


	def destroy
		@participant.destroy
		respond_to do |format|
			format.html { redirect_to :back, notice: "Your participation has been cancelled." }
			format.json { head :no_content }
		end
	end

	private

		def set_partygame
			@partygame = Partygame.find(params[:id])
		end

		def partygame_params
			params.require(:participant).permit(:lanparty_id, :game_id)
		end
end