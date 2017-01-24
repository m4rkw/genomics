require 'spec_helper'

describe package('opendj') do
  it { should be_installed }
end

describe service('opendj') do
  it { should be_enabled }
  it { should be_running }
end

[389, 636, 1689, 4444].each do |portn|
  describe port(portn) do
    it { should be_listening.with('tcp6') }
  end
end
