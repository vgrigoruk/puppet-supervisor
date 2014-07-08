require 'spec_helper'
# Rename this file to classname_spec.rb
# Check other boxen modules for examples
# or read http://rspec-puppet.com/tutorial/
describe 'supervisor' do
    should include_class('supervisor::params')
    should include_class('homebrew')
    should include_class('python')

    should contain_homebrew__formula('supervisor').
      with_before('Package[boxen/brews/supervisor]')
end
