class WpTermsController < ApplicationController
  # GET /wp_terms
  # GET /wp_terms.json
  def index
    @wp_terms = WpTerm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_terms }
    end
  end

  # GET /wp_terms/1
  # GET /wp_terms/1.json
  def show
    @wp_term = WpTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_term }
    end
  end

  # GET /wp_terms/new
  # GET /wp_terms/new.json
  def new
    @wp_term = WpTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_term }
    end
  end

  # GET /wp_terms/1/edit
  def edit
    @wp_term = WpTerm.find(params[:id])
  end

  # POST /wp_terms
  # POST /wp_terms.json
  def create
    @wp_term = WpTerm.new(params[:wp_term])

    respond_to do |format|
      if @wp_term.save
        format.html { redirect_to @wp_term, notice: 'Wp term was successfully created.' }
        format.json { render json: @wp_term, status: :created, location: @wp_term }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_terms/1
  # PUT /wp_terms/1.json
  def update
    @wp_term = WpTerm.find(params[:id])

    respond_to do |format|
      if @wp_term.update_attributes(params[:wp_term])
        format.html { redirect_to @wp_term, notice: 'Wp term was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_terms/1
  # DELETE /wp_terms/1.json
  def destroy
    @wp_term = WpTerm.find(params[:id])
    @wp_term.destroy

    respond_to do |format|
      format.html { redirect_to wp_terms_url }
      format.json { head :no_content }
    end
  end
end
