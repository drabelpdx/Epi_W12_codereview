require 'rails_helper'

describe User do
  it { should have_many :comments }
  it { should validate_confirmation_of :password }

end
