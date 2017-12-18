require 'spec_helper'

describe Url do
  it { should have_valid(:redirect_count).when(0) }
  it { should_not have_valid(:redirect_count).when(nil, "") }

  it { should have_valid(:original_url).when("https://stackoverflow.com/") }
  it { should_not have_valid(:original_url).when(nil, "") }

  it { should have_valid(:shortened_url).when("xsoif93js") }
  it { should_not have_valid(:shortened_url).when(nil, "") }
end
