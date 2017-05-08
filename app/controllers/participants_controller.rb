class ParticipantsController < ApplicationController
	before_action :set_participant, only: [:show, :edit, :update, :destroy]

	def show
	end

	def new
		@participant = Participant.new
		@lanparties = Lanparty.all - current_user.lanparties
	end

	def create
		@participant = Participant.new(participant_params)
		@participant.user = current_user
		respond_to do |format|
      if not current_user.lanparties.include?  @participant.lanparty and @participant.save
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

		def set_participant
			@participant = Participant.find(params[:id])
		end

		def participant_params
			params.require(:participant).permit(:lanparty_id, :user_id)
		end
end