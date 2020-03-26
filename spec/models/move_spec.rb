require "rails_helper"


RSpec.describe Move, type: :model do
    describe "\n Moves must have a name and description \n" do 
        
        it "Moves must have a name" do 
            move = Move.create(name: nil, description: "it hurts them!")
            expect(move.valid?).to be(false) 
        end

        it "Moves must have a description" do 
            move = Move.create(name: "Punch", description: nil)
            expect(move.valid?).to be(false)
        end
    end
end