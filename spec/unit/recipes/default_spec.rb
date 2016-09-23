require 'spec_helper'

describe 'particle_base::default' do
  before do
    stub_command("which bats").and_return('/usr/local/bin/bats')
  end
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'creates a directory /opt/particle_base owned by root' do
      expect(chef_run).to create_directory('/opt/particle-base/bin')
    end
  end
end
