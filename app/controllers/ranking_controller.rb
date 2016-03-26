class RankingController < ApplicationController
    
    def have
        item_rankings("have")
    end
    
    def want
        item_rankings("want")
    end
    
    private 
    def item_rankings(type)
        if    type == "have"
            @rankings = Have.group(:item_id).order('count_all desc').limit(10).count
        elsif type == "want"
            @rankings = Want.group(:item_id).order('count_all desc').limit(10).count
        else
            redirect_to root_path
        end
        render 'show'
    end
end
