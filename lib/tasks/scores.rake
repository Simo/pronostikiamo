namespace :graduatoria do

task :valuta => :environment do 
  @rounds = Round.where("id = 1 OR id = 31")
  @rounds.each do |round|
    @games = Game.where(:round_id => round.id)
    @games.each do |game|
      @bets = Bet.where(:game_id => game.id)
      @bets.each do |bet|
          bet.result = game.result
          bet.save!
      end
    end
  end
end

task :calcola => :environment do
  @bets = Bet.where("checked is null")
  @bets.each do |bet|
    score = Score.where("user_id=? AND champion_id=?", bet.user_id, bet.champion_id).all
    if score.count == 0
      score = Score.create!(:user_id => bet.user_id, :champion_id => bet.champion_id, :points => 0, :times => 0, :last_round => 0)
      unless bet.bid != bet.result
        score.points += 1
      end
      score.times += 1   
      unless score.last_round == bet.round_id
        score.last_round = bet.round_id
      end
     score.save!
     bet.checked = 1
     bet.save!
     puts "+ l'utente #{score.user.username} per il campionato #{score.champion.nome_campionato} ha scommesso #{score.times} totalizzando #{score.points}"
   else
     score = score.first
     unless bet.bid != bet.result
       score.points += 1
     end
     score.times += 1   
     unless score.last_round == bet.round_id
       score.last_round = bet.round_id
     end
    score.save!
    bet.checked = 1
    bet.save!
    puts "l'utente #{score.user.username} per il campionato #{score.champion.nome_campionato} ha scommesso #{score.times} totalizzando #{score.points}"
   end
  end
end

task :all => [:valuta, :calcola]

end