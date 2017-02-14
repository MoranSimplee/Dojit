require 'rails_helper'

describe User do

  include TestFactories

  describe "#favorited(post)" do
    before do
      @post1 = associated_post
      @post2 = associated_post
      @user = authenticated_user
    end

    it "returns `nil` if the user has not favorited the post" do
      expect(@user.favorited(@post2)).to eq(nil)
    end

    it "returns the appropriate favorite if it exists" do
      @user.favorites.create(post: @post1)
      expect(@user.favorited(@post1)).not_to be_nil
    end
  end
end