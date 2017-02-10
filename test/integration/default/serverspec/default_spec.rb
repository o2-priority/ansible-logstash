require 'spec_helper'

logstash_bin_dir = '/usr/share/logstash/bin'
logstash_log_dir = '/var/log/logstash'
logstash_conf_dir = '/etc/logstash/conf.d'
logstash_home_dir = '/usr/share/logstash'

describe group('logstash') do
  it { should exist }
end

describe user('logstash') do
  it { should exist }
  it { should belong_to_group 'logstash' }
end

describe package('logstash') do
  it { should be_installed }
end

%W(
  #{logstash_log_dir}
  #{logstash_home_dir}
  #{logstash_conf_dir}
  #{logstash_home_dir}/bin
).each do |d|
  describe file(d) do
    it { should be_directory }
  end
end

%W(
  #{logstash_conf_dir}/../logstash.yml
  #{logstash_conf_dir}/../jvm.options
  #{logstash_conf_dir}/../log4j2.properties
  /etc/default/logstash
).each do |f|
  describe file(f) do
    it { should be_file }
    it { should be_owned_by 'root' }
  end
end

%W(
  #{logstash_conf_dir}/10-input.conf
  #{logstash_conf_dir}/30-output.conf
).each do |f|
  describe file(f) do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'logstash' }
  end
end

describe command("#{logstash_bin_dir}/logstash-plugin list logstash-filter-multiline") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match 'logstash-filter-multiline' }
end

describe service('logstash') do
  it { should be_running }
end
