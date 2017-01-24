require 'spec_helper'

[
	"apt-transport-https",
	"ca-certificates",
	"software-properties-common",
	"language-pack-en",
	"vim",
	"wget",
	"curl",
	"telnet",
	"net-tools",
	"inetutils-ping",
	"git-core",
  "openssl"
].each do |package_name|
	describe package(package_name) do
		it { should be_installed }
	end
end
