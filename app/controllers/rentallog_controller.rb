class RentalLogController < Sinatra::Base
    set :default_content_type, 'application/json'

    get "/all" do
        logs = RentalLog.all
        logs.to_json(includes: [:items, :users])
    end

    get "/getstat" do
        return [rentedItems, returnedItems]
    end

    get "/:id" do
        log = RentalLog.find(params[:id]) rescue nil

        if log == nil
            return { message: "log not found" }.to_json            
        end
        log.to_json(includes: [:items, :users])
    end

    

    def rentedItems
        sql = "SELECT rental_logs.id, rental_levels.name as status, items.name as item,
                users.name as user FROM rental_logs
                LEFT JOIN items ON rental_logs.item_id = items.id
                LEFT JOIN rental_levels ON rental_logs.rental_level_id = rental_levels.id
                LEFT JOIN users ON rental_logs.user_id = users.id
                WHERE rental_level_id = 1 
                ORDER BY rental_logs.updated_at DESC"
        data = ActiveRecord::Base.connection.execute(sql)
        records_array = {
            rentedCount: data.count,
            rentdata: data,
            
        }
        return records_array.to_json
    end

    def returnedItems
        sql = "SELECT rental_logs.id, rental_levels.name as status, items.name as item,
                users.name as user FROM rental_logs
                LEFT JOIN items ON rental_logs.item_id = items.id
                LEFT JOIN rental_levels ON rental_logs.rental_level_id = rental_levels.id
                LEFT JOIN users ON rental_logs.user_id = users.id
                WHERE rental_level_id = 2
                ORDER BY rental_logs.updated_at DESC"
        data = ActiveRecord::Base.connection.execute(sql)
        records_array = {
            returnedCount: data.count,
            renturneddata: data,
            
        }
        return records_array.to_json
    end

    
end