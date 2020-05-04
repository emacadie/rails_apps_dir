class WpTermRelationshipsController < ApplicationController
  # GET /wp_term_relationships
  # GET /wp_term_relationships.json
  def index
    @wp_term_relationships = WpTermRelationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_term_relationships }
    end
  end

  # GET /wp_term_relationships/1
  # GET /wp_term_relationships/1.json
  def show
    @wp_term_relationship = WpTermRelationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_term_relationship }
    end
  end

  # GET /wp_term_relationships/new
  # GET /wp_term_relationships/new.json
  def new
    @wp_term_relationship = WpTermRelationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_term_relationship }
    end
  end

  # GET /wp_term_relationships/1/edit
  def edit
    @wp_term_relationship = WpTermRelationship.find(params[:id])
  end

  # POST /wp_term_relationships
  # POST /wp_term_relationships.json
  def create
    @wp_term_relationship = WpTermRelationship.new(params[:wp_term_relationship])

    respond_to do |format|
      if @wp_term_relationship.save
        format.html { redirect_to @wp_term_relationship, notice: 'Wp term relationship was successfully created.' }
        format.json { render json: @wp_term_relationship, status: :created, location: @wp_term_relationship }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_term_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_term_relationships/1
  # PUT /wp_term_relationships/1.json
  def update
    @wp_term_relationship = WpTermRelationship.find(params[:id])

    respond_to do |format|
      if @wp_term_relationship.update_attributes(params[:wp_term_relationship])
        format.html { redirect_to @wp_term_relationship, notice: 'Wp term relationship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_term_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_term_relationships/1
  # DELETE /wp_term_relationships/1.json
  def destroy
    @wp_term_relationship = WpTermRelationship.find(params[:id])
    @wp_term_relationship.destroy

    respond_to do |format|
      format.html { redirect_to wp_term_relationships_url }
      format.json { head :no_content }
    end
  end
end
