class SitemapController < ApplicationController
  def index
    @static_pages = [root_url, privacy_and_security_url, terms_of_use_url]
    @users = User.all
    @blogs = Blog.all
    respond_to do |format|
      format.xml
    end
  end
end
