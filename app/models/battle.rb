class Battle < ActiveRecord::Base
    require 'benchmark'
    attr_reader :right_answer, :math_sample, :answer_is_corrects

    has_many :battles_players
    has_many :players, through: :battles_players

    
    def check_user_answer
        self.check_timer
        user_answer = self.user_answer 
        system_answer = self.system_answer
        if user_answer == system_answer
            self.check_time_limit
            self.players.first[:game] == TRUE ? self.rp_points -= @damage : self.lp_points -= @damage
            self.check_game_progres
        else
            update(status: "uncorrect_answ")
        end
       
    end

    def saved_answer
        params.require(:battle).permit(:answer)
    end

    def change_turn_to_move

        if self.players.first[:game] == true 
            self.players.first.update(game: false) 
            self.players.last.update(game: true) 
        else
            self.players.first.update(game: true) 
            self.players.last.update(game: false) 
        end
    end

    def math_sample_generator
        exm = [rand(100), "", rand(100), "", rand(100)]
        
        exm[0] > exm[2] ? exm[1] = '-' : exm[1] = '+'  
        exm[2] < exm[4] ? exm[3] = '+' : exm[3] = '-'

        calculated = exm[0]
        exm[1] == '-' ? calculated -= exm[2] : calculated +=  exm[2]
        exm[3] == '-' ? calculated -= exm[4] : calculated +=  exm[4]
        @right_answer = calculated

        @math_sample  = ""
        6.times {|i| @math_sample << "#{exm[i]} "}
    end

    private

    def check_game_progres
        if self.lp_points <= 0
            update(lp_points: 0)
            self.players.first.update(loss: (self.players.first[:loss] + 1))
            self.players.last.update(win: (self.players.last[:win] + 1))
            update(status: "game_over")
        elsif self.rp_points <= 0
            update(rp_points:  0)
            self.players.last.update(loss: (self.players.last[:loss] + 1))
            self.players.first.update(win: (self.players.first[:win] + 1))
            update(status: "game_over")
        end
    end

    def check_timer
        time = (Time.now.utc - self.was_ready_at).to_i
        if time >= 20
            @damage = 0
        else
            @damage = (20 - time)
        end
    end

    def check_time_limit
        if @damage == 0
            update(status: "too_long")
        else
            update(status: "correct_answer",  damage: @damage)
        end
    end

    # first - lp, last - rp

    

end 