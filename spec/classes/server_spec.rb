require 'spec_helper'

describe 'openvpn::server' do
  context 'on Ubuntu 12.04 (Precise)' do
    let(:facts) { { 
      :lsbdistcodename => 'precise',
      :lsbdistrelease  => '12.04',
      :operatingsystem => 'Ubuntu',
    } }

    it do
      should contain_file('/etc/openvpn').with({
        'ensure' => 'directory',
        'group'  => 'root',
        'mode'   => '0644',
        'owner'  => 'root',
      })
    end

    it do
      should contain_file('/etc/default/openvpn').with({
        'ensure' => 'file',
        'group'  => 'root',
        'mode'   => '0644',
        'owner'  => 'root',
      })
    end

    it do
      should contain_package('openvpn').with_ensure('present')
    end

    it do
      should contain_service('openvpn').with({
        'ensure'     => 'running',
        'enable'     => true,
        'hasstatus'  => true,
        'hasrestart' => true,
      })
    end
  end
end

# vim:sw=2:ts=2:expandtab:textwidth=79
