class ProvidersController < ApplicationController
  def index
    @summaries = Summary.all
  end
end
