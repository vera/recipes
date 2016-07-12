require 'rails_helper'
require 'support/shared_examples/unique_and_present_name'

RSpec.describe Category, type: :model do
  it_behaves_like 'a model with unique and present name', :category
end
