class SettingsController < ApplicationController 
        def show
        end 
        
        def create
                current_user.update(user_params)
                redirect_to root_path, notice: "Your information was succesfully updated"
        end

        private 

        def user_params 
                params.require(:user).permit(:first_name, :last_name, :address_1, :address_2, :zip_code, :city, :state, :country, :about_me)
        end
end