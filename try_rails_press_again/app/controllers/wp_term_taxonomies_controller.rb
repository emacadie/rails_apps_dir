class WpTermTaxonomiesController < ApplicationController
  # GET /wp_term_taxonomies
  # GET /wp_term_taxonomies.json
  def index
    @wp_term_taxonomies = WpTermTaxonomy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_term_taxonomies }
    end
  end

  # GET /wp_term_taxonomies/1
  # GET /wp_term_taxonomies/1.json
  def show
    @wp_term_taxonomy = WpTermTaxonomy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_term_taxonomy }
    end
  end

  # GET /wp_term_taxonomies/new
  # GET /wp_term_taxonomies/new.json
  def new
    @wp_term_taxonomy = WpTermTaxonomy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_term_taxonomy }
    end
  end

  # GET /wp_term_taxonomies/1/edit
  def edit
    @wp_term_taxonomy = WpTermTaxonomy.find(params[:id])
  end

  # POST /wp_term_taxonomies
  # POST /wp_term_taxonomies.json
  def create
    @wp_term_taxonomy = WpTermTaxonomy.new(params[:wp_term_taxonomy])

    respond_to do |format|
      if @wp_term_taxonomy.save
        format.html { redirect_to @wp_term_taxonomy, notice: 'Wp term taxonomy was successfully created.' }
        format.json { render json: @wp_term_taxonomy, status: :created, location: @wp_term_taxonomy }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_term_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_term_taxonomies/1
  # PUT /wp_term_taxonomies/1.json
  def update
    @wp_term_taxonomy = WpTermTaxonomy.find(params[:id])

    respond_to do |format|
      if @wp_term_taxonomy.update_attributes(params[:wp_term_taxonomy])
        format.html { redirect_to @wp_term_taxonomy, notice: 'Wp term taxonomy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_term_taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_term_taxonomies/1
  # DELETE /wp_term_taxonomies/1.json
  def destroy
    @wp_term_taxonomy = WpTermTaxonomy.find(params[:id])
    @wp_term_taxonomy.destroy

    respond_to do |format|
      format.html { redirect_to wp_term_taxonomies_url }
      format.json { head :no_content }
    end
  end
end
