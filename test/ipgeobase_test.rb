# frozen_string_literal: true

require 'test_helper'

class IpgeobaseTest < Minitest::Test
  def setup
    test_response = File.read('./test/fixtures/test_response.xml')
    ip_address = '83.169.216.199'
    url = "http://ip-api.com/xml/#{ip_address}"
    stub_request(:get, url).to_return(status: 200, body: test_response)
    @ip_meta = Ipgeobase.lookup(ip_address)
  end

  def test_lookup
    assert(@ip_meta.city == 'Baranchinskiy')
    assert(@ip_meta.country == 'Russia')
    assert(@ip_meta.country_code == 'RU')
    assert((@ip_meta.lat - 58.1617).abs < Float::EPSILON)
    assert((@ip_meta.lon - 59.6991).abs < Float::EPSILON)
  end
end
