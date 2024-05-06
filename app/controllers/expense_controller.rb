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

    def payment_from
        tag_bill_from_a_person_from = TagABill.where(lender: current_user.id.to_s)
        split_bill_from_a_person_from = SplitABill.where(lender:current_user.id.to_s)
        @bill_from_a_person = tag_bill_from_a_person_from + split_bill_from_a_person_from
        
       # this code is to get all the data 

        # code to add payment status
        p "=========all parama passing wihle clicking the payemnt done btn ==========="
        p params[:lender]
        p params[:unique_expense_id]
        p type_of_btn_clicked = params[:type_of_btn]
        # p current_user_id = User.find_by(current_user.email)
        p current_user.id

        if type_of_btn_clicked == "payment_to"
            p "===========params for payment done from borrower side============="
            present_in_tag_a_bill_table = TagABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id], borrower:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id] , borrower:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.update(payment_status: "Pending")
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.update(payment_status: "Pending")
            else
                p "Expense not found in any table."
            end
        elsif type_of_btn_clicked == "payment_from"
            p "===========params for payment done from lender side============="
            present_in_tag_a_bill_table = TagABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id], lender:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id] , lender:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.update(payment_status: "Payment Done")
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.update(payment_status: "Payment Done")
            else
                p "Expense not found in any table."
            end
        else
            p "Something Happened I don't know anything about it"
        end



        p "==========*****=============params for delete request============****=============="
        p params[:lender]
        p params[:borrower]
        p params[:unique_expense_id]
        p params[:type_of_btn]
        # this code is for delete btn
        if type_of_btn_clicked == "borrower_delete_request"
            p "===========params for delete from borrower side============="
            present_in_tag_a_bill_table = TagABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id], borrower:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id] , borrower:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.update(delete_status: "Suspicious")
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.update(delete_status: "Suspicious")
            else
                p "Expense not found in any table."
            end
        elsif type_of_btn_clicked == "lender_delete_request"
            p "===========params for payment done from lender side============="
            present_in_tag_a_bill_table = TagABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id], lender:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id] , lender:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.delete
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.delete
            else
                p "Expense not found in any table."
            end
        else
            p "Something Happened in delete button and I don't know anything about it"
        end
        # this is the end for delete btn


    end
    def payment_to
        tag_bill_from_a_person_to = TagABill.where(borrower: current_user.id.to_s)
        split_bill_from_a_person_to = SplitABill.where(borrower:current_user.id.to_s)
        @bill_to_a_person = tag_bill_from_a_person_to + split_bill_from_a_person_to

        # this code is to get all the data 

        # code to add payment status
        p "=========all parama passing wihle clicking the payemnt done btn ==========="
        p params[:lender]
        p params[:unique_expense_id]
        p type_of_btn_clicked = params[:type_of_btn]
        # p current_user_id = User.find_by(current_user.email)
        p current_user.id

        if type_of_btn_clicked == "payment_to"
            p "===========params for payment done from borrower side============="
            present_in_tag_a_bill_table = TagABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id], borrower:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id] , borrower:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.update(payment_status: "Pending")
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.update(payment_status: "Pending")
            else
                p "Expense not found in any table."
            end
        elsif type_of_btn_clicked == "payment_from"
            p "===========params for payment done from lender side============="
            present_in_tag_a_bill_table = TagABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id], lender:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id] , lender:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.update(payment_status: "Payment Done")
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.update(payment_status: "Payment Done")
            else
                p "Expense not found in any table."
            end
        else
            p "Something Happened I don't know anything about it"
        end



        p "==========*****=============params for delete request============****=============="
        p params[:lender]
        p params[:borrower]
        p params[:unique_expense_id]
        p params[:type_of_btn]
        # this code is for delete btn
        if type_of_btn_clicked == "borrower_delete_request"
            p "===========params for delete from borrower side============="
            present_in_tag_a_bill_table = TagABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id], borrower:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id] , borrower:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.update(delete_status: "Suspicious")
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.update(delete_status: "Suspicious")
            else
                p "Expense not found in any table."
            end
        elsif type_of_btn_clicked == "lender_delete_request"
            p "===========params for payment done from lender side============="
            present_in_tag_a_bill_table = TagABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id], lender:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id] , lender:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.delete
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.delete
            else
                p "Expense not found in any table."
            end
        else
            p "Something Happened in delete button and I don't know anything about it"
        end
        # this is the end for delete btn
    end
    def payment_done
        tag_bill_from_a_person_to = TagABill.where(payment_status: "Payment Done")
        split_bill_from_a_person_to = SplitABill.where(payment_status: "Payment Done")
        @bill_done_to_a_person = tag_bill_from_a_person_to + split_bill_from_a_person_to
    end

    def show_expenses
        p "==========this is params =============="
        tag_bill_from_a_person_from = TagABill.where(lender: current_user.id.to_s)
        split_bill_from_a_person_from = SplitABill.where(lender:current_user.id.to_s)
        @bill_from_a_person = tag_bill_from_a_person_from + split_bill_from_a_person_from
        tag_bill_from_a_person_to = TagABill.where(borrower: current_user.id.to_s)
        split_bill_from_a_person_to = SplitABill.where(borrower:current_user.id.to_s)
        @bill_to_a_person = tag_bill_from_a_person_to + split_bill_from_a_person_to

        # this code is to get all the data 

        # code to add payment status
        p "=========all parama passing wihle clicking the payemnt done btn ==========="
        p params[:lender]
        p params[:unique_expense_id]
        p type_of_btn_clicked = params[:type_of_btn]
        # p current_user_id = User.find_by(current_user.email)
        p current_user.id

        if type_of_btn_clicked == "payment_to"
            p "===========params for payment done from borrower side============="
            present_in_tag_a_bill_table = TagABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id], borrower:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id] , borrower:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.update(payment_status: "Pending")
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.update(payment_status: "Pending")
            else
                p "Expense not found in any table."
            end
        elsif type_of_btn_clicked == "payment_from"
            p "===========params for payment done from lender side============="
            present_in_tag_a_bill_table = TagABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id], lender:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id] , lender:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.update(payment_status: "Payment Done")
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.update(payment_status: "Payment Done")
            else
                p "Expense not found in any table."
            end
        else
            p "Something Happened I don't know anything about it"
        end



        p "==========*****=============params for delete request============****=============="
        p params[:lender]
        p params[:borrower]
        p params[:unique_expense_id]
        p params[:type_of_btn]
        # this code is for delete btn
        if type_of_btn_clicked == "borrower_delete_request"
            p "===========params for delete from borrower side============="
            present_in_tag_a_bill_table = TagABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id], borrower:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(lender: params[:lender], unique_expense_id: params[:unique_expense_id] , borrower:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.update(delete_status: "Suspicious")
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.update(delete_status: "Suspicious")
            else
                p "Expense not found in any table."
            end
        elsif type_of_btn_clicked == "lender_delete_request"
            p "===========params for payment done from lender side============="
            present_in_tag_a_bill_table = TagABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id], lender:current_user.id)
            present_in_split_a_bill_table = SplitABill.find_by(borrower: params[:borrower], unique_expense_id: params[:unique_expense_id] , lender:current_user.id)
            if present_in_tag_a_bill_table
                present_in_tag_a_bill_table.delete
            elsif present_in_split_a_bill_table
                present_in_split_a_bill_table.delete
            else
                p "Expense not found in any table."
            end
        else
            p "Something Happened in delete button and I don't know anything about it"
        end
        # this is the end for delete btn
    end
    def pay_bill
        p "===========params for payment done============="
        p "#{params[:borrower]} => #{params[:unique_expense_id]}"
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
            unique_expense_id = SecureRandom.uuid
            p "***********************************"
            p params
            date_and_time = params[:date_and_time]
            category = params[:category]
            payment_type = params[:payment_type]
            params[:selectedValues].each do |key,value|
                p "#{params[:personnel_id]} => #{params[:prices][key]} => #{value} => #{date_and_time} => #{category} => #{payment_type} => #{params[:group_unique_id]}}"
                @tag_a_bill_to_anyone = TagABill.new
                @tag_a_bill_to_anyone.lender = params[:personnel_id]
                @tag_a_bill_to_anyone.amount = params[:prices][key]
                @tag_a_bill_to_anyone.borrower = value
                @tag_a_bill_to_anyone.date_and_time = date_and_time
                @tag_a_bill_to_anyone.category = category
                @tag_a_bill_to_anyone.payment_type = payment_type
                @tag_a_bill_to_anyone.group_unique_id = params[:group_unique_id]
                @tag_a_bill_to_anyone.remarks = params[:remarks]
                @tag_a_bill_to_anyone.unique_expense_id = unique_expense_id
                @tag_a_bill_to_anyone.save
            end
            redirect_to users_group_list_path
            p "*************************************"
        else 
            unique_expense_id = SecureRandom.uuid
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
                    @split_bill_to_all = SplitABill.new
                    @split_bill_to_all.borrower = giver
                    @split_bill_to_all.amount = amount_to_transfer.round(2)
                    @split_bill_to_all.lender = receiver
                    @split_bill_to_all.who_entered = params[:personnel_id]
                    @split_bill_to_all.category = params[:category]
                    @split_bill_to_all.payment_type = params[:payment_type]
                    @split_bill_to_all.group_unique_id = params[:group_unique_id]
                    @split_bill_to_all.date_and_time = params[:date_and_time]
                    @split_bill_to_all.remarks = params[:remarks]
                    @split_bill_to_all.unique_expense_id = unique_expense_id
                    @split_bill_to_all.save

                    to_give[giver] -= amount_to_transfer
                    to_receive[receiver] -= amount_to_transfer
                
                    break if to_give[giver] <= 0
                    end
                end
                redirect_to users_group_list_path
            #end
            p contributions
        end     
    end    
end
