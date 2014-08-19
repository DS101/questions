class UsersController < ApplicationController
  include HTTParty
  base_uri 'api.stackexchange.com'

  def initialize(attributes{})
    @name = attributes{:name}
  end

  def questions
    self.class.get("/2.2/questions", @options)
  end

  def users
    self.class.get("/2.2/users", @options)
  end
  
end