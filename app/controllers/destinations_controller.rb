class DestinationsController < ApplicationController
  def new
    @destination = Destination.new
     
  end

  def create
    @destination = Destination.new(params)
  end

  private

  def params

  end
end
