require 'spec_helper'

describe command('kubectl version') do
    its(:stdout) { should match /GitVersion\:\"v1\.7\.8\"/ }
end

describe command('kops version') do
    its(:stdout) { should match /Version\s+1\.7\.0/ }
end

describe command('helm version') do
    its(:stdout) { should match /SemVer\:\"v2\.7\.2\"/ }
end
