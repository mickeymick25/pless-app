class HomeController < ApplicationController
  def index
    @users = User.all
    #@bookatry = Message.new
  end
end
