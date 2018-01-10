require 'spec_helper'

#Check the AWS directory

describe file('/var/lib/jenkins/.aws') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'jenkins' }
end

describe file('/var/lib/jenkins/.aws/config') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'jenkins' }
    its(:content) { should match /output\s+=\s+json/ }
end

describe file('/var/lib/jenkins/.aws/credentials') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'jenkins' }
    its(:content) { should match /aws_access_key_id\s+=\s+yourAccessKeyIdHere/ }
end


#Check the Jenkins service
describe service('jenkins') do
    it { should be_running }
end

#Check the Jenkins user
describe user('jenkins') do
    it { should belong_to_group 'jenkins' }
    it { should belong_to_group 'docker' }
    it { should have_home_directory '/var/lib/jenkins' }
    it { should have_login_shell '/bin/bash' }
end

#Check the Jenkins cli
describe file('/var/lib/jenkins/jenkins-cli.jar') do
    it { should exist }
end

#Check Jenkins version
describe file('/var/lib/jenkins/jenkins.install.InstallUtil.lastExecVersion') do
    its(:content) { should match /2\.100/ }
end
