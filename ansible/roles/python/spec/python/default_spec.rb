require 'spec_helper'

describe package('python2.7') do
  it { should be_installed }
end

describe command('/usr/bin/python --version') do
  its(:stderr) { should match '^Python 2\.7\.[0-9]+$' }
end
