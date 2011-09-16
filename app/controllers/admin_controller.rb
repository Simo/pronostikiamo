class AdminController < ApplicationController

  
  def index
    	@campionati = Champion.order(:priority)
  end
	
  def giornata
    
    #inserisco la parte che era su valuta
    # data
    oggi = Date.today
    ieri = Date.parse('2011-10-09')
    
    #parametri
    @camp = params[:cmp]
    camp = params[:cmp]
    
    #istanze
    gior = Round.turni_attuali(camp,oggi).first
    @partite = Game.partite_turno(gior)
    @partite_label = Game.partite_turno(gior)
    @giornata = Round.find(gior)
    
    respond_to do |format|
      format.html
      format.js {render :layout => false}
  	end
     
  end
  
  def update_plus
    @games = params[:games]
    @games.each do |id, result|
      partita = Game.find(id).update_attributes(result)
    end
 		redirect_to admin_path	
  end
  
end
