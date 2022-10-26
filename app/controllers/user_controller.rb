class UserController < Sinatra::Base
    set :default_content_type, 'application/json'

    get "/all" do
        users = User.all
        users.to_json
    end

    get "/:id" do
        user = User.find(params[:id])
        user.to_json(include: :rental_logs)
    end

    put "/:id" do
        user = User.find(params[:id]) rescue nil
        if user == nil
            return { message: "User not found" }.to_json            
        end

        user.update(
            email: params[:email]
        )
        user.to_json
    end

    
end