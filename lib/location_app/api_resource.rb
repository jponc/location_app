require 'active_support/core_ext/string'

module LocationApp
  class APIResource
    extend LocationApp::APIOperations::Request

    def self.class_name
      self.name.split('::')[-1]
    end

    def self.resource_url
      if self == APIResource
        raise NotImplementedError.new('APIResource is an abstract class.  You should perform actions on its subclasses (Inbox, Communication, etc.)')
      end
      "/#{CGI.escape(class_name.downcase.pluralize)}"
    end

    def initialize data
      data.each do |method_name, value|
        self.class.send(:attr_accessor, method_name) unless self.class.method_defined?(method_name)
        send("#{method_name}=", value)
      end
    end

    def resource_url
      unless id = self.id
        raise InvalidRequestError.new("Could not determine which URL to request: #{self.class} instance has invalid ID: #{id.inspect}", 'id')
      end
      "#{self.class.resource_url}/#{CGI.escape(id)}"
    end

    def serialize
      {
        'data' => serialize_data
      }
    end

    def serialize_data
      data = {}
      self.instance_variables.map do |var|
        key = var.to_s.gsub('@', '')
        data[key] = self.send(key)
      end
      data
    end

    def class_type
      self.class.class_name.downcase.pluralize
    end
  end
end
