class PostsController < ApplicationController
  before_action :sign_in_required, only: [:new, :edit, :update, :destroy, :comment]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
    @posts = @posts.all.order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(10)
  end

  def search
    @word = params[:word]
    @posts = Post.where("summary LIKE ?", "%#{params[:word]}%").or(Post.where("content LIKE ?", "%#{params[:word]}%"))
    @posts = @posts.all.order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(10)
  end

  def ensure_correct_user
    if current_user.id != Post.find_by(id: params[:id]).user_id
      redirect_to("/")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @artist = @post.artist
    @album = @post.album
  end

  def new
    @post = Post.new
    if params[:album_id]
      @album = Album.find(params[:album_id])
      @artist = Artist.find(params[:artist_id])
    elsif params[:artist_id]
      @artist = Artist.find(params[:artist_id])
    end
  end

  def create
    if params[:score] == "nil"
      score = nil
    else
      score = params[:score]
    end
    if Post.find_by(user_id: params[:user_id], album_id: params[:album_id])
      redirect_to("/")
      return
    end
    @post = Post.new(
      summary: params[:summary],
      content: params[:content],
      user_id: params[:user_id],
      blog_url: params[:blog_url],
      score: score,
      album_id: params[:album_id],
      artist_id: params[:artist_id],
      html: params[:html]
    )
    if @post.save
      flash[:notice] = "投稿しました"
      if params[:album_id]
        redirect_to("/artists/#{params[:artist_id]}/albums/#{params[:album_id]}")
      else
        redirect_to("/artists/#{params[:artist_id]}")
      end
    else
      if params[:album_id]
        @album = Album.find_by(id: params[:album_id])
        @artist = Artist.find_by(id: params[:artist_id])
        render :new
      else
        @artist = Artist.find_by(id: params[:artist_id])
        render :new
      end
    end
  end

  def edit
    if params[:album_id]
      @album = Album.find_by(id: params[:album_id])
      @artist = Artist.find_by(id: params[:artist_id])
    else
      @artist = Artist.find_by(id: params[:artist_id])
    end
    @post = Post.find_by(id: params[:id])
  end

  def update
    if params[:score] == "nil"
      score = nil
    else
      score = params[:score]
    end
    @post = Post.find_by(id: params[:id])
    if @post.update(
      summary: params[:summary],
      content: params[:content],
      user_id: params[:user_id],
      blog_url: params[:blog_url],
      score: score,
      album_id: params[:album_id],
      artist_id: params[:artist_id],
      html: params[:html]
    )
      flash[:notice] = "投稿を更新しました"
      if params[:album_id]
        redirect_to("/artists/#{params[:artist_id]}/albums/#{params[:album_id]}")
      else
        redirect_to("/artists/#{params[:artist_id]}")
      end
    else
      if params[:album_id]
        @album = Album.find_by(id: params[:album_id])
        @artist = Artist.find_by(id: params[:artist_id])
        render :edit
      else
        @artist = Artist.find_by(id: params[:artist_id])
        render :edit
      end
    end
  end

  def comment
    @comment = Comment.new(
      user_id: current_user.id,
      post_id: params[:id],
      text: params[:text]
    )
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "コメント投稿失敗"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if params[:album_id]
      redirect_path = "/artists/#{params[:artist_id]}/albums/#{params[:album_id]}"
    else
      redirect_path = "/artists/#{params[:artist_id]}"
    end
    @post.destroy
    respond_to do |format|
      format.html { redirect_to redirect_path , notice: '削除しました' }
      format.json { head :no_content }
    end
  end
end
