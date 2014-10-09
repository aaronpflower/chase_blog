require 'spec_helper'

describe Comment do
  
  let(:admin) { FactoryGirl.create(admin) }
  let(:post) { FactoryGirl.create(post) }
  before { @comment = FactoryGirl.create :comment }

  subject { @comment }

  it { should belong_to :post }
  it { should belong_to :user }
  it { should belong_to :admin }
end
