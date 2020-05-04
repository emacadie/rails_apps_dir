class WpPostsController < ApplicationController
  # GET /wp_posts
  # GET /wp_posts.json
  def index
    @wp_posts = WpPost.where("post_type = ? AND post_status = ?", 'post', 'publish')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_posts }
    end
  end

  # GET /wp_posts/1
  # GET /wp_posts/1.json
  def show
    @wp_post = WpPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_post }
    end
  end

  # GET /wp_posts/new
  # GET /wp_posts/new.json
  def new
    @wp_post = WpPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_post }
    end
  end

  # GET /wp_posts/1/edit
  def edit
    @wp_post = WpPost.find(params[:id])
  end

  # POST /wp_posts
  # POST /wp_posts.json
  def create
    @wp_post = WpPost.new(params[:wp_post])

    respond_to do |format|
      if @wp_post.save
        format.html { redirect_to @wp_post, notice: 'Wp post was successfully created.' }
        format.json { render json: @wp_post, status: :created, location: @wp_post }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_posts/1
  # PUT /wp_posts/1.json
  def update
    @wp_post = WpPost.find(params[:id])

    respond_to do |format|
      if @wp_post.update_attributes(params[:wp_post])
        format.html { redirect_to @wp_post, notice: 'Wp post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_posts/1
  # DELETE /wp_posts/1.json
  def destroy
    @wp_post = WpPost.find(params[:id])
    @wp_post.destroy

    respond_to do |format|
      format.html { redirect_to wp_posts_url }
      format.json { head :no_content }
    end
  end
end
