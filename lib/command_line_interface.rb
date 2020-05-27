require 'pry'
#     puts "
#     _______     __    ____   ___  ____ _____  _    _     
#    |_   _\ \   / /   |  _ \ / _ \|  _ \_   _|/ \  | |    
#      | |  \ \ / /____| |_) | | | | |_) || | / _ \ | |    
#      | |   \ V /_____|  __/| |_| |  _ < | |/ ___ \| |___ 
#      |_|    \_/      |_|    \___/|_| \_\|_/_/   \_\_____|
                                                         
#   "

    def greet
        puts "Thanks for signing up for 'TV PORTAL'!"
    end 

    def run
        greet
        3.times do 
            puts ""
        end
        puts "Looking for something to watch? That's a hard choice to make. Let me help you!"
        3.times do 
            puts ""
        end
        puts "Tell me an actor you like, and I'll find a show for you."
        actor = gets.chomp.to_s
        fav_actor = Actor.find_by(name: actor)
        fav_actor_role = Role.find_by(actor_id: fav_actor.id)
        opinion = Review.find_by(role_id: fav_actor_role)
        puts opinion.review
        
    end

    

