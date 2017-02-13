require 'rails_helper'

include TestFactories

describe Vote do
  describe "validations" do

    before do
      post1 = associated_post
      post2 = associated_post
      post3 = associated_post
      @v1 = Vote.new(value: 1, post: post1, user: post1.user)
      @v2 = Vote.new(value: -1, post: post2, user: post2.user)
      @v3 = Vote.new(value: 2, post:post3, user: post3.user)
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@v1.valid?).to eq(true)
        expect(@v2.valid?).to eq(true)
        expect(@v3.valid?).to eq(false)
      end
    end

    describe 'after_save' do
      it "calls `Post#update_rank` after save" do
        post = associated_post
        vote = Vote.new(value: 1, post: post, user: post.user)
        expect(post).to receive(:update_rank)
        vote.save
      end
    end

  end
end