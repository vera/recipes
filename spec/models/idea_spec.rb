require "rails_helper"
require 'support/shared_examples/unique_and_present_name'

describe Idea do
  it_behaves_like 'a model with unique and present name'

  context "without a category" do
    subject { described_class.new(name: "Aha!", category: nil) }
    it { is_expected.not_to be_valid }
  end
end
