require 'pry'
require 'tty-prompt'


    def greet
        # puts "
        # ____   ___  ____ _____  _    _     
        # |  _ \ / _ \|  _ \_   _|/ \  | |    
        # | |_) | | | | |_) || | / _ \ | |    
        # |  __/| |_| |  _ < | |/ ___ \| |___ 
        # |_|    \___/|_| \_\|_/_/   \_\_____|

        # "
        puts "Thanks for signing up for 'PORTAL'!"
        puts "Welcome to your link to the world of Television."
        puts "With PORTAL you can look up reviews of shows or actors in the show, or you can leave a review about something you just watched."
        home
    end 

    def home
        prompt = TTY::Prompt.new
        home_menu = prompt.select("What can I help you with today?", marker: "*") do |home|
            home.choice "Find an Actor or Show"
            home.choice "Leave a Review"
            home.choice "Delete a Review"
            home.choice "Find Something to Watch"
            end
            if home_menu == "Find an Actor or Show"
                system 'clear'
                find_my_favorite
            elsif home_menu == "Leave a Review"
                system 'clear'
                leave_review
            elsif home_menu == "Delete a Review"
                system 'clear'
                leave_review
            elsif home_menu == "Find Something to Watch"
                system 'clear'
                reviews
            end
    
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
            fav_actor = Actor.find_by(name: actor).id
            fav_actor_role = Role.find_by(actor_id: fav_actor)
            opinion = Review.find_by(role_id: fav_actor_role)
            puts opinion.review
        elsif answer == "show"
            system 'clear'
            puts "What's your favorite show?"
            show = gets.chomp.to_s
            fav_show = Show.find_by(name: show).id
            fav_show_role = Role.find_by(show_id: fav_show)
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
            fav_actor.shows.each do |show|
                puts show.name
            end
        elsif answer == "show"
            system 'clear'
            puts "What's your favorite show?"
            show = gets.chomp.to_s
            fav_show = Show.find_by(name: show)
            fav_show.actors.each do |actor|
                puts actor.name
            end
        end        
    end

    def delete_review
        puts "So, you've changed your mind. Which review would you like to delete? (actor/show)"
        answer = gets.chomp.downcase
        if answer == "actor"
            puts "Which actor are you thinking of?"
            actor_name = gets.chomp
            actor = Actor.find_by(name: actor_name).id
            role = Role.find_by(actor_id: actor).id
            new_role = Review.find_by(role: role)
            new_role.destroy
        elsif answer == "show"
            puts "Which show are you thinking of?"
            show_name = gets.chomp
            show = Show.find_by(name: show_name).id
            role = Role.find_by(show_id: show).id
            new_role = Review.find_by(role: role)
            new_role.destroy
        end
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
            system 'clear'
            puts new_role.review
        elsif answer == "show"
            puts "Which show are you thinking of?"
            show_name = gets.chomp
            show = Show.find_by(name: show_name).id
            role = Role.find_by(show_id: show).id
            new_role = Review.create(role_id: role)
            new_role.review = gets.chomp.to_s
            system 'clear'
            puts new_role.review
        end
    end



    

