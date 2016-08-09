require "spec_helper"
require "rails_helper"
require 'support/shared_examples/unique_and_present_name'

describe Recipe do
  it_behaves_like 'a model with unique and present name', :recipe

  context "without a category" do
    subject { build(:recipe, category_id: nil) }
    it { is_expected.not_to be_valid }
  end
end
