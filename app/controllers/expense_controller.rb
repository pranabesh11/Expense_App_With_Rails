class ExpenseController < ApplicationController
    def add_expense
        @users = User.all
        p "**************************"
         p users=User.all
        p "**************************"
        @person = User.find(params[:user_id])
        p "===================================="
        p @person
        p params
        p @type = params[:extra_param]
        p @personnel_id = params[:user_id]
        p "===================================="
    end
    def tag_a_bill
        @users = User.all
        p "**************************"
         p users=User.all
        p "**************************"
        @person = User.find(params[:user_id])
        p "===================================="
        p @person
        p params
        p @type = params[:extra_param]
        p @personnel_id = params[:user_id]
        p "===================================="
    end

    def form_four
        @users = User.all
        p "***************"
        p params[:date_and_time]
        p params[:category]
        p params[:payment_type]
        p params[:remarks]
        p params[:prices]
        p params[:selectedValues]
        p "****************"
    end

    def show_expenses
        
    end
    
    def create_new_expense
        
        p "=================================="
        p params
        type_of_button_submitted = params[:commit]
        if type_of_button_submitted=="Create Item"
            params.each do |key,value|
          
                if key == "field_one"
                # Assuming params is the hash provided
                  field_one_values = params[:field_one]
                  field_two_values = params[:field_two]
      
                  # Iterate over each value of field_one and field_two
                  field_one_values.each_with_index do |item, index|
                  item_name = item
                  item_amount = field_two_values[index]
      
                  # Now you can use item_name and item_amount as needed
                  puts " #{params[:personnel_id]} Item: #{item_name} => Amount: #{item_amount} => #{params[:income_or_expense]} => #{params[:remarks]}  => #{params[:date_and_time]} => #{params[:category]} => #{params[:payment_type]}"
                    @new_personal_expense = Item.new
                    @new_personal_expense.item_name = item_name
                    @new_personal_expense.amount = item_amount
                    @new_personal_expense.remarks = params[:remarks]
                    @new_personal_expense.user_id = params[:personnel_id]
                    @new_personal_expense.date_and_time = params[:date_and_time]
                    @new_personal_expense.category = params[:category]
                    @new_personal_expense.payment_type = params[:payment_type]
                    @new_personal_expense.income_or_expense = params[:income_or_expense]
                    @new_personal_expense.save
                  end
                end
               
            end
        elsif type_of_button_submitted=="Tag A Bill"
            no_of_person = params[:items].size
            total_price = 0
            params[:field_two].each do |amount|
                total_price+=amount.to_i
            end
            each_person_cost = total_price/no_of_person
            all_items = params[:field_one].join(" , ")
            params[:items].each do |person|
                p "==================================="
                puts "#{person} => #{params[:date_and_time]} => #{params[:category]} => #{params[:payment_type]} => #{all_items} => #{each_person_cost} => #{params[:remarks]}"
                p "==================================="
            end
        else 
            if params[:prices].is_a?(ActionController::Parameters)
                prices_field_value = params[:prices].permit!.to_h
            else
                prices_field_value = {}
            end
        
            if params[:selectedValues].is_a?(ActionController::Parameters)
                id_of_all_users = params[:selectedValues].permit!.to_h
            else
                id_of_all_users = {}
            end
        
            prices_field_value.each_with_index do |(key, value), index|
                user_id = id_of_all_users[key]
                puts "#{params[:personal_id]} => #{params[:date_and_time]} => #{params[:category]} => #{params[:payment_type]} => #{user_id} => #{value}"
            end
        end     
    end

    
end
