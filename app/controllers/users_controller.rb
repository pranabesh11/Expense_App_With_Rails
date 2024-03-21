class UsersController < ApplicationController
    def index
        @users=User.all
    end

    def home
        @users=User.all
        @quote = QuoteService.random_quote
        if @quote
            @quote.each do |quote|
                @content = quote['content']
                @author = quote['author']
            end          
        else
          flash[:alert] = "Failed to load quote."
          redirect_to root_path
        end
    end
        
    def personnel_create
        @user = User.new
        @user.name = params[:name]
        @user.email = params[:email].downcase
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
        
        if @user.save
            flash[:notice] = "Account created successfully!"
            redirect_to users_new_path 
        else
            flash.now[:alert] = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
            render :new
        end
    end

    def edit
        @personnel = User.find(params[:format])
    end

    def personnel_edit
        personnel = User.find(params[:personnel_id])
        personnel.update(name:params[:name] ,email:params[:email])
        redirect_to users_index_path
    end

    def personnel_delete
        p personnel = User.find(params[:format])
        personnel.destroy
        redirect_to users_index_path
    end

    

end
