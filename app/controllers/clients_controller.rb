class ClientsController < ApplicationController
  before_action :find_user, only: [:index, :create, :show, :edit, :update, :destroy]
  before_action :find_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = @user.clients
  end

  def new
    @client = Client.new
    render layout: false
  end

  def create
    @client = @user.clients.new(client_params)

    if @client.save
      flash[:success] = 'Customer profile created.'
      redirect_to "/users/#{@user.id}/clients/#{@client.id}", status: 200
    else
      flash[:info] = @client.errors.full_messages.first
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      flash[:success] = 'Customer profile updated.'
      redirect_to @client
    else
      flash[:danger] = 'Unable to update profile.'
      render 'edit'
    end
  end

  def destroy
    if @client
      @client.destroy
      redirect_to @user.clients
    end
  end

  private

    def client_params
      params.require(:client).permit(:company_name, :value)
    end

    def find_user
      @user = User.find_by(id: session[:user_id])
    end

    def find_client
      @client = @user.clients.find_by(id: params[:id])
    end
end
