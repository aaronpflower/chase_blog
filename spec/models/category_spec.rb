require 'spec_helper'

describe Category do
	it { should have_many :category_posts }
	it { should have_many :posts }
end
