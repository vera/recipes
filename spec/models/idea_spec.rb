require "rails_helper"

describe Idea do
  it "has a title" do # yep, you can totally use 'it'
    idea = Idea.new
    idea.name = ''
    expect(idea.valid?).to eq(false)
  end
end
