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
        @responses = Item.find(@items_key)
        
        # findでは回数順になっていないので、順番を並べ変える。
        @items=[]
        @rankings.length.times{|num|
            @items.push(@responses.find{|item| item.id == @rankings.keys[num]})
        }
        render 'show'
    end
end
