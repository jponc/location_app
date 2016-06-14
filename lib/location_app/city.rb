module LocationApp
  class City < APIResource
    extend LocationApp::APIOperations::List

    def self.find_using_ip(ip)
      url = File.join(resource_url, "from_ip?ip=#{ip}")
      result = get(url)
      raise "Not found" if result['status'] == 404
      new(result)
    end

    def self.autocomplete(query)
      url = File.join(resource_url, "autocomplete?query=#{query}")
      list(url)
    end
  end
end
