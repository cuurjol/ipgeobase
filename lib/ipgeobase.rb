# frozen_string_literal: true

require 'addressable/uri'
require 'net/http'
require_relative 'ipgeobase/version'
require_relative 'ipgeobase/metadata'

module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip_address)
    uri = Addressable::URI.parse("http://ip-api.com/xml/#{ip_address}")
    response = Net::HTTP.get(uri)
    Metadata.parse(response, single: true)
  end
end
