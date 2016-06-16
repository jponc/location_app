require 'pry'
require 'rubygems'
require 'active_support/inflector'
require "location_app/version"

# API Operations
require 'api_operations/list'
require 'api_operations/request'

# Resources
require 'location_app/api_resource'
require 'location_app/city'
require 'location_app/region'
require 'location_app/country'

module LocationApp
  #@api_base = 'http://location-service.90secondsdev.com/api'
  @api_base = 'http://52.39.222.56/api'

  class << self
    attr_accessor :api_base
  end 
end
