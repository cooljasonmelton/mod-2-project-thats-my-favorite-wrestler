require "rails_helper"


RSpec.describe Wrestler, type: :model do
    describe "\n Wrestlers must have a name and bio \n" do 
        
        it "Wrestlers must have a name" do 
            wrestler = Wrestler.create(name: nil, bio: "the pain maker!")
            expect(wrestler.valid?).to be(false) 
        end

        it "Wrestlers must have a bio" do 
            wrestler = Wrestler.create(name: "Dave Wrestleman", bio: nil)
            expect(wrestler.valid?).to be(false)
        end
    end
end