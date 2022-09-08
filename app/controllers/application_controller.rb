class ApplicationController < Sinatra::Base

   #Set content type header for all responses'
   set :default_content_type, 'application/json'

   # add routes
   get '/bakeries' do

      #return all bakeries

      bakeries = Bakery.all

      bakeries.to_json
  
    end

    get '/bakeries/:id' do

      #return a single bakery

      bakery = Bakery.find(params[:id])

      bakery.to_json(include: :baked_goods)
  
    end

    get '/baked_goods/by_price' do
      baked_goods_price = BakedGood.by_price

      baked_goods_price.to_json

    end

    get '/baked_goods/most_expensive' do
      most_expensive  = BakedGood.by_price.first

      most_expensive.to_json
    end



end