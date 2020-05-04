class WpLinksController < ApplicationController
  # GET /wp_links
  # GET /wp_links.json
  def index
    @wp_links = WpLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_links }
    end
  end

  # GET /wp_links/1
  # GET /wp_links/1.json
  def show
    @wp_link = WpLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_link }
    end
  end

  # GET /wp_links/new
  # GET /wp_links/new.json
  def new
    @wp_link = WpLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_link }
    end
  end

  # GET /wp_links/1/edit
  def edit
    @wp_link = WpLink.find(params[:id])
  end

  # POST /wp_links
  # POST /wp_links.json
  def create
    @wp_link = WpLink.new(params[:wp_link])

    respond_to do |format|
      if @wp_link.save
        format.html { redirect_to @wp_link, notice: 'Wp link was successfully created.' }
        format.json { render json: @wp_link, status: :created, location: @wp_link }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_links/1
  # PUT /wp_links/1.json
  def update
    @wp_link = WpLink.find(params[:id])

    respond_to do |format|
      if @wp_link.update_attributes(params[:wp_link])
        format.html { redirect_to @wp_link, notice: 'Wp link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_links/1
  # DELETE /wp_links/1.json
  def destroy
    @wp_link = WpLink.find(params[:id])
    @wp_link.destroy

    respond_to do |format|
      format.html { redirect_to wp_links_url }
      format.json { head :no_content }
    end
  end
end
