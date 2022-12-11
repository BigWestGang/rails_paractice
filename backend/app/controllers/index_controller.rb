class IndexController < ApplicationController
  def index
    render json: {message: 'Hello, World'}, status: 200
  end
end
