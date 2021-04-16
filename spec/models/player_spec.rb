require 'rails_helper'

RSpec.describe Player, type: :model do
    context "validation tests" do
        it "ensures title is present" do
            player = Player.new(name: "t")
            expect(player.valid?).to eq(false)
        end

        it "ensures title is present" do
            player = Player.new(name: "test")
            expect(player.valid?).to eq(true)
        end

        it "ensures total_buttle is 1 by default" do 
            player = Player.new(name: "test")
            expect(player.total_battles).to eq(1)
        end

        it "ensures game is false by default" do 
            player = Player.new(name: "test")
            expect(player.game).to eq(false)
        end
    end
end