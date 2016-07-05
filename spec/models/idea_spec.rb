require "rails_helper"

describe Idea do
  context 'without a name' do
    subject { Idea.new(name: '')          }
    it      { is_expected.not_to be_valid }
  end

  context 'with a duplicate name' do
    before  { Idea.new(name: 'Test').save! }
    subject { Idea.new(name: 'Test')       }
    it      { is_expected.not_to be_valid  }

    context 'bypassing validations' do
      subject { Idea.new(name: 'Test').save(validate: false)                   }
      it      { expect{ subject }.to raise_error ActiveRecord::RecordNotUnique }
    end
  end
end
