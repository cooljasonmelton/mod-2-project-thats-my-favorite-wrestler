require "rails_helper"
require "./app/models/user.rb"


RSpec.describe User, type: :model do
    before(:all) do
        @user = User.create(name: "April", bio: "what's up", password_digest: "password", email: "email.email")
    end 


    describe "\n All user fields are required \n" do 

        it "returns a user's name as a string" do
            expect(@user.name.class).to be(String)
        end 

        it "returns a user's bio as a string" do
            expect(@user.name.class).to be(String)
        end 
        
        it "Users must have a bio" do 
            @user.update(bio: nil)
            expect(@user.valid?).to be(false) 
        end

        it "Users must have a password" do 
            @user.update(password_digest: nil)
            expect(@user.valid?).to be(false)
        end

        it "Users must have an email" do 
            @user.update(email: nil)
            expect(@user.valid?).to be(false)
        end

        it "Users must have a name" do 
            @user.update(name: nil)
            expect(@user.valid?).to be(false)
        end

    end

    # describe "\n Testing User Methods \n" do 
    #     before(:each) do 
    #         @user = User.create(name: "April", bio: "what's up", password_digest: "password", email: "email.email")
    #         @move = Move.create(name: "Punch", description: "you've never heard of getting punched?")
    #         @fav_move = FavoriteMove.create(user_id: user.id, move_id: move.id, rating: 1)
    #     end 
    #     describe "getting a users favorite moves" do
    #         expect(@user.user_favorite_moves).to include(@move)
    #     end  
    # end 



end

