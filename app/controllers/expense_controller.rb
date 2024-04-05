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
    def split_a_bill
        @users = User.all
        @group_id = params[:group_id]
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
        @group_id = params[:group_id]
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
            p "***********************************"
            p params
            date_and_time = params[:date_and_time]
            category = params[:category]
            payment_type = params[:payment_type]
            params[:selectedValues].each do |key,value|
                p "#{params[:personnel_id]} => #{params[:prices][key]} => #{value} => #{date_and_time} => #{category} => #{payment_type} => #{params[:group_unique_id]}}"
            end
            p "*************************************"
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
            contributions = {}
            present_person = []

            prices_field_value.each_with_index do |(key, value), index|
                user_id = id_of_all_users[key]
                # puts "#{params[:personnel_id]} => #{params[:date_and_time]} => #{params[:category]} => #{params[:payment_type]} => #{user_id} => #{value}"
                p contributions[user_id] = value 
                present_person<< user_id.to_i
            end
            all_person_id_group_wise = Cluster.where(groupIduuid:params[:group_unique_id]).pluck(:userId)
                        
            p left_person = all_person_id_group_wise - present_person
            left_person.each do |ids|
                contributions[ids.to_s] = "0"
            end
            
            
            #prices_field_value.each_with_index do |(key, value), index|
                #user_id = id_of_all_users[key]
                # puts "#{params[:personnel_id]} => #{params[:date_and_time]} => #{params[:category]} => #{params[:payment_type]} => #{user_id} => #{value}"
                # Calculate total amount and the average contribution
                p no_of_people_in_group = Cluster.where(groupIduuid:params[:group_unique_id]).count
                total_amount = contributions.values.map(&:to_i).sum
                average_contribution = total_amount.to_f / no_of_people_in_group
                # Calculate who needs to get or give money
                to_receive = {}
                to_give = {} 
                contributions.each do |person, amount|
                    balance = amount.to_i - average_contribution
                    if balance > 0
                      to_receive[person] = balance
                    elsif balance < 0
                      to_give[person] = -balance
                    end
                end
                # Determine transactions
                to_give.each do |giver, amount_give|
                    to_receive.each do |receiver, amount_receive|
                    next if amount_give <= 0 || amount_receive <= 0
                
                    amount_to_transfer = [amount_give, amount_receive].min
                    puts "#{giver} should give #{amount_to_transfer.round(2)} rs to #{receiver} => #{params[:personnel_id]} => #{params[:date_and_time]} => #{params[:category]} => #{params[:payment_type]} => #{params[:group_unique_id]}"
                
                    to_give[giver] -= amount_to_transfer
                    to_receive[receiver] -= amount_to_transfer
                
                    break if to_give[giver] <= 0
                    end
                end

            #end
            p contributions
        end     
    end

    
end
