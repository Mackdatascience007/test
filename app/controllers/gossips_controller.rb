class GossipsController < ApplicationController
  def index
    @gossip = Gossip.all
    @user = User.all
  end
  
  def show
    @gossip = Gossip.find(params[:id])
    @user = User.all
    @day = @gossip.created_at.day
    @month = @gossip.created_at.month
    @year = @gossip.created_at.year
  end

  def new
    @gossip = Gossip.new
  end

  def create
    # @gossip = Gossip.new(title: params["title"],content: params["content"],user_id: 3) # avec xxx qui sont les données obtenues à partir du formulaire
    # if @gossip.save # essaie de sauvegarder en base @gossip
    #   redirect_to gossips_path# si ça marche, il redirige vers la page d'index du site
    # else
    #   render 'new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
    # end
    @gossip = Gossip.create(gossip_params)
    @gossip.user = User.find_by(id: session[:user_id])
    if @gossip.save
      flash[:success] = "Potin bien créé !"
      redirect_to root_path
    else
      render :new
    end
  end

end
