class RelationshipsController < ApplicationController
	before_filter :signed_in_user

  def create
   @usuario = Usuario.find(params[:relationship][:followed_id])
    current_user.follow!(@usuario)
    respond_to do |format|
      format.html { redirect_to @usuario }
      format.js
    end
  end

  def destroy
   @usuario = Relationship.find(params[:id]).followed
    current_user.unfollow!(@usuario)
    respond_to do |format|
      format.html { redirect_to @usuario }
      format.js
    end
  end
  end