module Jenkins
  class Store
    attr_reader :location
    def initialize
      @location = File.join(File.dirname(__FILE__), '..', '..','store')
      FileUtils.mkdir_p(location)
      `(cd #{location} && git init)` unless File.directory?(File.join(location,'.git'))
    end

  end
end
