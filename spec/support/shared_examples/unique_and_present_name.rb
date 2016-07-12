require "rails_helper"
RSpec.shared_examples "a model with unique and present name" do |parameter|
  context 'without a name' do
    subject { described_class.new(name: '')          }
    it      { is_expected.not_to be_valid }
  end

  context 'with a duplicate name' do
    before  { described_class.new(name: 'Test').save! }
    subject { described_class.new(name: 'Test')       }
    it      { is_expected.not_to be_valid  }

    context 'bypassing validations' do
      subject { described_class.new(name: 'Test').save(validate: false)                   }
      it      { expect{ subject }.to raise_error ActiveRecord::RecordNotUnique }
    end
  end
end
