require 'spec_helper'

describe AccountDetail do
	
	it { should respond_to(:account) }
  it { should respond_to(:account_id) }
  it { should respond_to(:city) }
  it { should respond_to(:street) }

end