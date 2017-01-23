require 'spec_helper'

describe file('/etc/apt/sources.list.d/ppa_webupd8team_java_xenial.list') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by "root" }
  it { should be_grouped_into "root" }
  it { should be_mode 644 }
  its(:content) { should eq "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main\n" }
end

describe command('debconf-show oracle-java8-installer') do
  its(:stdout) { should match '^\* shared\/accepted-oracle-license-v1-1\: true$' }
end

[
  "oracle-java8-installer",
  "oracle-java8-set-default"
].each do |package_name|
  describe package(package_name) do
    it { should be_installed }
  end
end
