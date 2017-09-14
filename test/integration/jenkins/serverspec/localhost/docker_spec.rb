require 'spec_helper'

describe service('docker') do
    it { should be_running }
end

describe command('curl -sL -w "%{http_code}\\n" "localhost:237" -o /dev/null | sed "s/[0-9]\+/OK/"') do
    its(:stdout) { should match 'OK' }
  end
