class UsersController < ApplicationController
    def index
        @users=User.all
    end
    def create_group
        @all_users_to_create_group=User.all
    end
    def create_group_post
        uuid = SecureRandom.uuid
        params[:items].each do |id|
            @create_group = Cluster.new
            @create_group.groupIduuid = uuid
            @create_group.groupname = params[:name]
            @create_group.userId = id.to_i
            @create_group.save 
        end
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

    # from here i am writing code for group and cluster
    def group_list
        @all_group_information = Cluster.all
        @unique_group_names = Cluster.select(:groupname, :groupIduuid ).distinct       
        @total_number_of_member = Cluster.group(:groupname).count
        @all_group_information = Cluster.all

        # all users names
        @names_array = []
        @unique_group_names.each do |unique_id|
            @all_names = []
            @all_group_information.each do |all_data|           
                if unique_id.groupIduuid == all_data.groupIduuid
                    temp_names = User.find(all_data.userId)
                    @all_names << temp_names.name
                end
            end
            @names_array << @all_names.join(" , ")
        end

        # this code is to get those group where current user is present
        @all_group_unique_id_curr_user = []
        @unique_group_id = Cluster.select(:groupIduuid).distinct.pluck(:groupIduuid)
        @unique_group_id.each do |unid|
            @user_id_from_group_id = Cluster.where(groupIduuid: unid).pluck(:userId)
            current_log_in_user_email = current_user.email 
            present = User.where(email:current_log_in_user_email).pluck(:id)
            @user_id_from_group_id.each do |userid|
                @current_user_email = User.where(id:userid).pluck(:email)              
            end
            if @user_id_from_group_id.include?(present[0])
                @all_group_unique_id_curr_user << unid
            end
        end
    end
end
