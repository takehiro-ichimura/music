class HomesController < ApplicationController
  def top
    @posts = Post.all.shuffle()
  end

  def terms
  end

  def contact
  end

  def aboutus
  end
end
