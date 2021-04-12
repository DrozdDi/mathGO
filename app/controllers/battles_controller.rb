class BattlesController < ApplicationController
    before_action :set_starter_setting, only: [ :create ]
    before_action :current_battle, only: [ :show, :edit, :update, :destroy ]
    add_flash_types :error

    def index
        @battles = Battle.all
    end

    def show
        @battle  = Battle.find(params[:id])
        
    end

    def new
        @battle = Battle.new
    end

    def create
        if @battle.save
            @battle.update(status: "first_move")
            redirect_to @battle
        else
            flash.now[:error] = "Ім'я  гравця має містити не менше двох символів."
            render :new 
        end
    end

    def edit
        @battle.update(was_ready_at: Time.now.utc)
        @battle.math_sample_generator
        @battle.update(system_answer: @battle.right_answer)
    end  

    def update
        @battle.update(user_answer: saved_answer[:answer])
        @battle.check_user_answer
        @battle.change_turn_to_move
    
        respond_to do |format|
            if @battle.save
                format.html { redirect_to @battle, action: 'show'}
            else
                format.html { render :new, status: :unprocessable_entity }
            end
          end        
    end

    private

    def set_starter_setting
        @battle = Battle.new 
        @battle[:has_players] = "#{battle_params[:left_player]} - #{battle_params[:right_player]}"
        @battle[:system_answer] = 1010 
        
        @battle.players << Player.create(name: battle_params[:left_player], game: TRUE)
        @battle.players << Player.create(name: battle_params[:right_player])

    end

    def current_battle
        @battle = Battle.find(params[:id])
      end

    def battle_params
       params.require(:battle).permit(:left_player, :right_player)
    end

    def saved_answer
        params.require(:battle).permit(:answer)
    end

end