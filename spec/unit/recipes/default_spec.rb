#
# Cookbook Name:: particle-programmer-shield
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'particle-base::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'creates a directory /opt/particle-base owned by root' do
      expect(chef_run).to create_directory('/opt/particle-base').with(
        user: 'root',
        group: 'root',
      )
    end
    it 'installs all packages'
  end
end
