require "rails_helper"
require "spec_helper"

RSpec.shared_examples "a model with unique and present name" do |factory|
  context 'without a name' do
    subject { build(factory, name: nil) }
    it      { is_expected.not_to be_valid }
  end

  context 'with a duplicate name' do
    before  { create(factory) }
    subject { build(factory)       }
    it      { is_expected.not_to be_valid  }

    context 'bypassing validations' do
      subject { build(factory).save(validate: false) }
      it      { expect{ subject }.to raise_error ActiveRecord::RecordNotUnique }
    end
  end
end
