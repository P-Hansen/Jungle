require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    # create_table "users", force: :cascade do |t|
    #   t.string   "name"
    #   t.string   "email"
    #   t.string   "password_digest"
    #   t.datetime "created_at",      null: false
    #   t.datetime "updated_at",      null: false
    #   t.string   "last_name"
    # end
    before :each do
        @user = User.new(
        name: "egg",
        last_name: "eggerson",
        email: "egg@eggmail.com",
        password: "password",
        password_confirmation: "password"
        )
    end

    it "fails to save when first name is ommited" do
      @user.name = ""
      expect(@user.save).to eq false
    end

    it "fails to save when last name name is ommited" do
      @user.last_name = ""
      expect(@user.save).to eq false
    end

    it "can create a new user with a valid lastname" do
      expect(@user).to be_valid
    end

    it "can't create a new user with an invalid lastname" do
      @user.last_name = ""
      expect(@user).not_to be_valid
    end

    it "can't create a new user with a password below 5 char" do
      @user.password = "aaa"
      @user.password_confirmation = "aaa"
      expect(@user.save).to eq false
    end

    it "fails when the same email is already in db" do
      expect(@user.save).to eq true
      @user2 = User.new(
          name: "egg2",
          last_name: "nil2",
          email: "egg@eggmail.com",
          password: "password",
          password_confirmation: "password"
          )
        expect(@user2.save).to eq false
      end

      it "fails when the same email with a differnt case is already in db" do
        expect(@user.save).to eq true
        @user2 = User.new(
            name: "egg2",
            last_name: "nil2",
            email: "EGG@EGGMAIL.com",
            password: "password",
            password_confirmation: "password"
            )
        expect(@user2.save).to eq false
      end

  end
end