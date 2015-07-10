require 'rails_helper'

describe Project do
  it {should belong_to :category}
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

end
