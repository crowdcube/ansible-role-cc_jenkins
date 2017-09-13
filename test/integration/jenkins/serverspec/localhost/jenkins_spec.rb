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