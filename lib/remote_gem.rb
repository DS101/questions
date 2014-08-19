class RemoteGem
  include HTTParty
 
  base_uri "rubygems.org/api/v1"
 
  attr_accessor :name, :info, :version, :authors, :downloads
 
  def initialize(attributes = {})
    @name = attributes[:name]
    @info = attributes[:info]
    @version = attributes[:version]
    @authors = attributes[:authors]
    @downloads = attributes[:downloads]
  end
 
  # Возвращает номер версии для этого отдельного RemoteGem
  def versions
    response = self.class.get("/versions/#{name}.json")
    if response.success?
      response
    else
      raise response.response
    end
  end
 
  # Ищем отдельный gem, используя его имя
  def self.find(name)
    response = get("/gems/#{name}.json")
    if response.success?
      self.new(response["name"], response["info"], response["version"], 
         response["authors"], response["downloads"])
    else
      # отвечает за net/http ответ
      raise response.response    
    end
  end
end