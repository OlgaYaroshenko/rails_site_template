class StaticPagesController < ApplicationController

  def home
    if signed_in?
    end
  end

  def nil_routes
    redirect_to root_path
  end
end
