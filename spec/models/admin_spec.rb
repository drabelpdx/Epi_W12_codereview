require 'rails_helper'

describe Admin do
  it { should validate_confirmation_of :password }

end
