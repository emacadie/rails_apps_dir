class WpPostmetaController < ApplicationController
  # GET /wp_postmeta
  # GET /wp_postmeta.json
  def index
    @wp_postmeta = WpPostmetum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_postmeta }
    end
  end

  # GET /wp_postmeta/1
  # GET /wp_postmeta/1.json
  def show
    @wp_postmetum = WpPostmetum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_postmetum }
    end
  end

  # GET /wp_postmeta/new
  # GET /wp_postmeta/new.json
  def new
    @wp_postmetum = WpPostmetum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_postmetum }
    end
  end

  # GET /wp_postmeta/1/edit
  def edit
    @wp_postmetum = WpPostmetum.find(params[:id])
  end

  # POST /wp_postmeta
  # POST /wp_postmeta.json
  def create
    @wp_postmetum = WpPostmetum.new(params[:wp_postmetum])

    respond_to do |format|
      if @wp_postmetum.save
        format.html { redirect_to @wp_postmetum, notice: 'Wp postmetum was successfully created.' }
        format.json { render json: @wp_postmetum, status: :created, location: @wp_postmetum }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_postmetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_postmeta/1
  # PUT /wp_postmeta/1.json
  def update
    @wp_postmetum = WpPostmetum.find(params[:id])

    respond_to do |format|
      if @wp_postmetum.update_attributes(params[:wp_postmetum])
        format.html { redirect_to @wp_postmetum, notice: 'Wp postmetum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_postmetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_postmeta/1
  # DELETE /wp_postmeta/1.json
  def destroy
    @wp_postmetum = WpPostmetum.find(params[:id])
    @wp_postmetum.destroy

    respond_to do |format|
      format.html { redirect_to wp_postmeta_url }
      format.json { head :no_content }
    end
  end
end
