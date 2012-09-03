
require 'json'
module Jenkins
  class Job

    def initialize(url, name = nil)
      @url = url.gsub(' ','%20')
      @name = name
    end

    def find()
      json = JSON.parse(`curl -s #{@url}/api/json?depth=0`)
      json["jobs"].map {|job| job['name'] }
    end

    def config
      config_url = "#@url/job/#@name/config.xml"
      `curl -s #{config_url}`
    end

    def self.find(url)
      self.new(url).find
    end
  end

end

