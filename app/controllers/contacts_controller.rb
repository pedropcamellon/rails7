class ContactsController < ApplicationController
    def new
      @contact = Contact.new
      render layout: false
    end
  
    def create
      client = Client.find_by(id: params[:client_id])
      @contact = client.contacts.new(contact_params)
  
      if @contact.save
        render partial: 'show', locals: {contact: @contact}
      else
        render 'new'
      end
    end
  
    def show
      render layout: false
    end
  
    def edit
      client = Client.find_by(id: params[:client_id])
      @contact = client.contacts.find_by(id: params[:id])
      render layout: false
    end
  
    def update
      client = Client.find_by(id: params[:client_id])
      @contact = client.contacts.find_by(id: params[:id])
  
      if @contact.update(contact_params)
        flash[:success] = 'Contact profile updated.'
        redirect_to "/users/#{client.user_id}/clients/#{client.id}"
      else
        flash[:danger] = 'Unable to update contact profile.'
        render 'edit'
      end
    end
  
    def destroy
      if @contact = Contact.find_by(id: params[:id])
        @contact.destroy
        redirect_to "/users/#{@contact.client.user.id}/clients/#{@contact.client.id}"
      end
    end
  
    private
  
    def contact_params
      params.require(:contact).permit(:name, :role, :email, :phone, :decision_maker)
    end
  end
  