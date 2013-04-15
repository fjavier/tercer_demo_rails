class MicropostsController < ApplicationController
 	before_filter :signed_in_usuario, only: [:create, :destroy]
   before_filter :correct_user,   only: :destroy

  def create
  	@micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost Creado!"
      redirect_to root_url
    else
      @feed_items = []
      render 'paginas_estaticas/home'
    end
  end

  def destroy
     @micropost.destroy
     redirect_to root_url
  end

  private
  def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url unless current_user?(@micropost.usuario)
      #redirect_to root_url if @micropost.nil?
    end
end