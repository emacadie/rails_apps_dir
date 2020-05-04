class WpUsersController < ApplicationController
  # GET /wp_users
  # GET /wp_users.json
  def index
    @wp_users = WpUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_users }
    end
  end

  # GET /wp_users/1
  # GET /wp_users/1.json
  def show
    @wp_user = WpUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_user }
    end
  end

  # GET /wp_users/new
  # GET /wp_users/new.json
  def new
    @wp_user = WpUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_user }
    end
  end

  # GET /wp_users/1/edit
  def edit
    @wp_user = WpUser.find(params[:id])
  end

  # POST /wp_users
  # POST /wp_users.json
  def create
    @wp_user = WpUser.new(params[:wp_user])

    respond_to do |format|
      if @wp_user.save
        format.html { redirect_to @wp_user, notice: 'Wp user was successfully created.' }
        format.json { render json: @wp_user, status: :created, location: @wp_user }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_users/1
  # PUT /wp_users/1.json
  def update
    @wp_user = WpUser.find(params[:id])

    respond_to do |format|
      if @wp_user.update_attributes(params[:wp_user])
        format.html { redirect_to @wp_user, notice: 'Wp user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_users/1
  # DELETE /wp_users/1.json
  def destroy
    @wp_user = WpUser.find(params[:id])
    @wp_user.destroy

    respond_to do |format|
      format.html { redirect_to wp_users_url }
      format.json { head :no_content }
    end
  end
end
