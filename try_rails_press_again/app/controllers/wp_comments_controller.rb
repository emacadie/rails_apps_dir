class WpCommentsController < ApplicationController
  # GET /wp_comments
  # GET /wp_comments.json
  def index
    @wp_comments = WpComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_comments }
    end
  end

  # GET /wp_comments/1
  # GET /wp_comments/1.json
  def show
    @wp_comment = WpComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_comment }
    end
  end

  # GET /wp_comments/new
  # GET /wp_comments/new.json
  def new
    @wp_comment = WpComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_comment }
    end
  end

  # GET /wp_comments/1/edit
  def edit
    @wp_comment = WpComment.find(params[:id])
  end

  # POST /wp_comments
  # POST /wp_comments.json
  def create
    @wp_comment = WpComment.new(params[:wp_comment])

    respond_to do |format|
      if @wp_comment.save
        format.html { redirect_to @wp_comment, notice: 'Wp comment was successfully created.' }
        format.json { render json: @wp_comment, status: :created, location: @wp_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_comments/1
  # PUT /wp_comments/1.json
  def update
    @wp_comment = WpComment.find(params[:id])

    respond_to do |format|
      if @wp_comment.update_attributes(params[:wp_comment])
        format.html { redirect_to @wp_comment, notice: 'Wp comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_comments/1
  # DELETE /wp_comments/1.json
  def destroy
    @wp_comment = WpComment.find(params[:id])
    @wp_comment.destroy

    respond_to do |format|
      format.html { redirect_to wp_comments_url }
      format.json { head :no_content }
    end
  end
end
