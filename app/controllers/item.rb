class ItemController < Sinatra::Base
    set :default_content_type, 'application/json'

    get "/all" do
        items = Item.all
        items.to_json
    end

    get "/:id" do
        item = Item.find(params[:id]) rescue nil

        if item == nil
            return { message: "item not found" }.to_json            
        end
        item.to_json(include: :rental_logs)
    end

    post "/new" do
        item = Item.create(
            name: params[:name],
            item_type_id: params[:item_type_id]
        )
        item.to_json
    end

    put "/:id" do
        item = Item.find(params[:id]) rescue nil
        if item == nil
            return { message: "item not found" }.to_json            
        end

        item.update(
            email: params[:email]
        )
        item.to_json
    end

    delete "/:id" do
        item = Item.find(params[:id]) rescue nil
        if item == nil
            return { message: "item not found" }.to_json            
        end

        item.destroy
        item.to_json
    end

    
end