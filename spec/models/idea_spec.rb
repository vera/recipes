require "rails_helper"
require 'support/shared_examples/unique_and_present_name'

describe Idea do
  it_behaves_like 'a model with unique and present name'
end
