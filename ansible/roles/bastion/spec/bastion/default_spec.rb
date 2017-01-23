require 'spec_helper'

[
  "git-core",
  "ruby",
  "ruby-dev",
  "python-pip",
  "python-dev",
  "iotop",
  "htop"
].each do |package_name|
	describe package(package_name) do
		it { should be_installed }
	end
end

[
  "distribute",
  "python-consul",
  "boto",
  "boto3",
  "jinja2",
  "paramiko",
  "PyYAML",
  "awscli",
  "ansible",
  "molecule",
  "ansible-vagrant",
  "docker-py"
].each do |package_name|
  describe package(package_name) do
    it { should be_installed.by('pip') }
  end
end

[
  "serverspec",
  "rake",
  "docker-api",
  "rspec"
].each do |package_name|
  describe package(package_name) do
    it { should be_installed.by('gem') }
  end
end

describe file("/home/ubuntu/ansible") do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by "ubuntu" }
  it { should be_grouped_into "ubuntu" }
  it { should be_mode 755 }
end

describe file("/home/ubuntu/ansible/.git/config") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by "ubuntu" }
  it { should be_grouped_into "ubuntu" }
  it { should be_mode 644 }
  its(:content) { should match /\[remote "origin"\][\s\t\r\n]+url = https:\/\/github\.com\/m4rkw\/genomics\n/ }
end
