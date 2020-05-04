class WpOptionsController < ApplicationController
  # GET /wp_options
  # GET /wp_options.json
  def index
    @wp_options = WpOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_options }
    end
  end

  # GET /wp_options/1
  # GET /wp_options/1.json
  def show
    @wp_option = WpOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_option }
    end
  end

  # GET /wp_options/new
  # GET /wp_options/new.json
  def new
    @wp_option = WpOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_option }
    end
  end

  # GET /wp_options/1/edit
  def edit
    @wp_option = WpOption.find(params[:id])
  end

  # POST /wp_options
  # POST /wp_options.json
  def create
    @wp_option = WpOption.new(params[:wp_option])

    respond_to do |format|
      if @wp_option.save
        format.html { redirect_to @wp_option, notice: 'Wp option was successfully created.' }
        format.json { render json: @wp_option, status: :created, location: @wp_option }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_options/1
  # PUT /wp_options/1.json
  def update
    @wp_option = WpOption.find(params[:id])

    respond_to do |format|
      if @wp_option.update_attributes(params[:wp_option])
        format.html { redirect_to @wp_option, notice: 'Wp option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_options/1
  # DELETE /wp_options/1.json
  def destroy
    @wp_option = WpOption.find(params[:id])
    @wp_option.destroy

    respond_to do |format|
      format.html { redirect_to wp_options_url }
      format.json { head :no_content }
    end
  end
end
