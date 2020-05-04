class WpCommentmetaController < ApplicationController
  # GET /wp_commentmeta
  # GET /wp_commentmeta.json
  def index
    @wp_commentmeta = WpCommentmetum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_commentmeta }
    end
  end

  # GET /wp_commentmeta/1
  # GET /wp_commentmeta/1.json
  def show
    @wp_commentmetum = WpCommentmetum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_commentmetum }
    end
  end

  # GET /wp_commentmeta/new
  # GET /wp_commentmeta/new.json
  def new
    @wp_commentmetum = WpCommentmetum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_commentmetum }
    end
  end

  # GET /wp_commentmeta/1/edit
  def edit
    @wp_commentmetum = WpCommentmetum.find(params[:id])
  end

  # POST /wp_commentmeta
  # POST /wp_commentmeta.json
  def create
    @wp_commentmetum = WpCommentmetum.new(params[:wp_commentmetum])

    respond_to do |format|
      if @wp_commentmetum.save
        format.html { redirect_to @wp_commentmetum, notice: 'Wp commentmetum was successfully created.' }
        format.json { render json: @wp_commentmetum, status: :created, location: @wp_commentmetum }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_commentmetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_commentmeta/1
  # PUT /wp_commentmeta/1.json
  def update
    @wp_commentmetum = WpCommentmetum.find(params[:id])

    respond_to do |format|
      if @wp_commentmetum.update_attributes(params[:wp_commentmetum])
        format.html { redirect_to @wp_commentmetum, notice: 'Wp commentmetum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_commentmetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_commentmeta/1
  # DELETE /wp_commentmeta/1.json
  def destroy
    @wp_commentmetum = WpCommentmetum.find(params[:id])
    @wp_commentmetum.destroy

    respond_to do |format|
      format.html { redirect_to wp_commentmeta_url }
      format.json { head :no_content }
    end
  end
end
