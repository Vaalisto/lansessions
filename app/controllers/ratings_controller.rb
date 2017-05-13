class RatingsController < ApplicationController    

  
  def new
    @rating = Rating.new
    @games = Game.all
  end
 
  def create
    @rating = Rating.new(rating_params)
    if current_user.nil?
      redirect_to signin_path, notice: "Please, sign in"
    elsif @rating.save
      current_user.ratings << @rating
      redirect_to(:back)
    else
      @games = Game.all
      render :new
    end    
  end  
  
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:score, :game_id)
    end
end
