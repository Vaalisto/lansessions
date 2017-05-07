class ParticipantsController < ApplicationController

	

	def destroy
		@participant.destroy
		respond_to do |format|
			format.html { redirect_to @participant.user, notice: "Your participation to #{@participant.lanparty.partyname} has been cancelled." }
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