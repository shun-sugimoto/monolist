class RankingController < ApplicationController
    
    def have
        @type = "Have"
        item_rankings(@type)
    end
    
    def want
        @type = "Want"
        item_rankings(@type)
    end
    
    private 
    def item_rankings(type)
        @rankings = Ownership.where(type: @type).group(:item_id).limit(10).order('count_all desc').count
        @items = []
        @rankings.length.times{ |num|
        @items = @items + Item.where(id: [@rankings.keys[num]])
        }
        render 'show'
    end
end
