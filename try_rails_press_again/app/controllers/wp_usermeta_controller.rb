class WpUsermetaController < ApplicationController
  # GET /wp_usermeta
  # GET /wp_usermeta.json
  def index
    @wp_usermeta = WpUsermetum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_usermeta }
    end
  end

  # GET /wp_usermeta/1
  # GET /wp_usermeta/1.json
  def show
    @wp_usermetum = WpUsermetum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_usermetum }
    end
  end

  # GET /wp_usermeta/new
  # GET /wp_usermeta/new.json
  def new
    @wp_usermetum = WpUsermetum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_usermetum }
    end
  end

  # GET /wp_usermeta/1/edit
  def edit
    @wp_usermetum = WpUsermetum.find(params[:id])
  end

  # POST /wp_usermeta
  # POST /wp_usermeta.json
  def create
    @wp_usermetum = WpUsermetum.new(params[:wp_usermetum])

    respond_to do |format|
      if @wp_usermetum.save
        format.html { redirect_to @wp_usermetum, notice: 'Wp usermetum was successfully created.' }
        format.json { render json: @wp_usermetum, status: :created, location: @wp_usermetum }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_usermetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_usermeta/1
  # PUT /wp_usermeta/1.json
  def update
    @wp_usermetum = WpUsermetum.find(params[:id])

    respond_to do |format|
      if @wp_usermetum.update_attributes(params[:wp_usermetum])
        format.html { redirect_to @wp_usermetum, notice: 'Wp usermetum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_usermetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_usermeta/1
  # DELETE /wp_usermeta/1.json
  def destroy
    @wp_usermetum = WpUsermetum.find(params[:id])
    @wp_usermetum.destroy

    respond_to do |format|
      format.html { redirect_to wp_usermeta_url }
      format.json { head :no_content }
    end
  end
end
