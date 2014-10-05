# Each post is tied to the admin
# Each post can have comments from users or the admin
require 'spec_helper'  

describe Post do
  
  let(:admin) { FactoryGirl.create(:admin) }
  # before { @post = admin.posts.build(content: "Lorem ipsum") }
  before { @post = FactoryGirl.create :post, admin: admin }

  subject { @post }
  
  it { should respond_to(:content) }
  it { should respond_to(:admin_id) }
  it { should respond_to(:admin) }

  it { should have_many :category_posts }
  it { should have_many :categories }
  
  its(:admin_id) { should eq admin.id } # it makes sure the post post/admin association matches

  it { should be_valid }

  describe "when admin_id is not present" do
  	before { @post.admin_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank content" do 
  	before { @post.content = " " }
  	it { should_not be_valid }
  end

  describe "with content that is too long" do 
  	before { @post.content = "a" * 5001 }
  	it { should_not be_valid }
  end
end
