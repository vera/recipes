require "rails_helper"

describe Idea do
  it "has a title" do
    idea = Idea.new
    idea.name = ''
    expect(idea.valid?).to eq(false)
  end

  it "has a unique title" do
    idea1 = Idea.new
    idea2 = Idea.new
    idea1.name = 'Test'
    idea2.name = 'Test'
    idea2.save
    expect(idea1).not_to be_valid
  end

  it "has a unique constraint on title" do
    idea1 = Idea.new
    idea2 = Idea.new
    idea1.name = 'Test'
    idea2.name = 'Test'
    idea2.save
    expect{idea1.save(:validate => false)}.to raise_error ActiveRecord::RecordNotUnique
  end
end
