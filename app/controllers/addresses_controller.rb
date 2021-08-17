class AddressesController < ApplicationController
    
    def index
        @addresses = Address.all
    end  
    def show
        @address = Address.find_by(id: params[:id])  
    end    
    def new
        @address = Address.new
    end  
    def edit
        @address = Address.find_by(id: params[:id])  
    end  
    def create 
        @address = Address.new(address_params)
        respond_to do |format|
            if @address.save
              format.html { redirect_to address_path(@address), notice: 'Address is successfully created.'}
            else
              format.html { render :new }
            end
        end
    end
    def update
        @address = Address.find_by(id: params[:id])
        respond_to do |format|
          if @address.update(address_params)
            format.html { redirect_to @address, notice: 'Todo list was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
      end   
    def destroy
        @address = Address.find_by(id: params[:id])
        @address.destroy
        respond_to do |format|
          format.html { redirect_to addresses_url , notice: 'Address is successfully destroyed.' }
        end
      end     
    def address_params
        params.require(:address).permit(:address_line1, :address_line2, :city, :country, :pincode)
    end  

end    
