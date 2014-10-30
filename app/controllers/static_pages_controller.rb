class StaticPagesController < ApplicationController

  def home
    if signed_in?
    end
  end

  def privacy_and_security
  end

  def terms_of_use
  end

  def how_it_works
  end

  def nil_routes
    redirect_to root_path
  end
end
