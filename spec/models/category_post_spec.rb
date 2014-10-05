require 'spec_helper'

describe CategoryPost do
  it { should belong_to :post }
  it { should belong_to :category }
end
