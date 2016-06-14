module LocationApp
  module APIOperations
    module List
      def list(url = nil)
        url ||= resource_url
        results = get(url)
        results.map do |result|
          new(result)
        end
      end
      alias :all :list

      def find(id)
        url = File.join(resource_url, id.to_s)
        result = get(url)
        raise "Not found" if result['status'] == 404
        new(result)
      end
    end
  end
end
