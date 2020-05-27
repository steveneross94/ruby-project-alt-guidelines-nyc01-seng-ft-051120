require 'pry'


    def greet
        puts "Thanks for signing up for 'PORTAL'!"
        puts "Welcome to your link to the world of Television."
        puts "With PORTAL you can look up reviews of shows or actors in the show, or you can leave a review about something you just watched."
    end 



    def reviews

        puts "Looking for something to watch? That's a hard choice to make. Let me help you!"
        3.times do 
            puts ""
        end
        puts "So, do you have a favorite actor? Or, perhaps, a favorite show?"
        answer = gets.chomp.downcase
        if answer == "actor" 
            system 'clear'
            puts "Who is your favorite actor?"
            actor = gets.chomp
            fav_actor = Actor.find_by(name: actor)
            fav_actor_role = Role.find_by(actor_id: fav_actor.id)
            opinion = Review.find_by(role_id: fav_actor_role)
            puts opinion.review
        elsif answer == "show"
            system 'clear'
            puts "What's your favorite show?"
            show = gets.chomp
            fav_show = Show.find_by(name: show)
            fav_show_role = Role.find_by(show_id: fav_show.id)
            opinion = Review.find_by(role_id: fav_show_role)
            puts opinion.review
        end        
    end

    def find_my_favorite
        puts "Are you looking for an actor or a show?"
        answer = gets.chomp.downcase
        if answer == "actor" 
            system 'clear'
            puts "Which actor are you looking for?"
            actor = gets.chomp.to_s
            fav_actor = Actor.find_by(name: actor)
            show = Role.find_by(show_id: fav_actor.id)
            binding.pry
     
        elsif answer == "show"
            system 'clear'
            puts "What's your favorite show?"
            show = gets.chomp.to_s
            fav_show = Show.find_by(name: show)
            fav_show_role = Role.find_by(show_id: fav_show.id)
        end        
    end

    def delete_review(role)
        Review.find_by(role_id: role).delete
    end

    def leave_review
        puts "Are you leaving a review for an actor or show?"
        answer = gets.chomp.downcase
        if answer == "actor"
            puts "Which actor are you thinking of?"
            actor_name = gets.chomp
            actor = Actor.find_by(name: actor_name).id
            role = Role.find_by(actor_id: actor).id
            new_role = Review.create(role_id: role)
            new_role.review = gets.chomp.to_s
        elsif answer == "show"
            puts "Which show are you thinking of?"
            show_name = gets.chomp
            show = Show.find_by(name: show_name).id
            role = Role.find_by(show_id: show).id
            new_role = Review.create(role_id: role)
            new_role.review = gets.chomp.to_s
        end
    end

    
    

