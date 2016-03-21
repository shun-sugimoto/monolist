class RankingController < ApplicationController
    
    def have
        item_rankings("Have")
    end
    
    def want
        item_rankings("Want")
    end
    
    private 
    def item_rankings(type)
        @rankings = Ownership.where(type: type).group(:item_id).limit(10).order('count_all desc').count
        @items_key = []
        @rankings.length.times{|num|
            @items_key.push(@rankings.keys[num])
        }
        @items = Item.find(@items_key)
        render 'show'
    end
end
