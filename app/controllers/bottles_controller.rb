class BottlesController < ApplicationController

  def index
    @bottles = Bottle.all.order(created_at: 'desc')
  end

end
