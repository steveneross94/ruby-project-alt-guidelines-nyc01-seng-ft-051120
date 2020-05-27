Actor.delete_all
Show.delete_all
Review.delete_all
Role.delete_all

#actor - name and char name
tommy = Actor.create(name: "Cillian Murphy", character_name: "Thomas Shelby")
alfie = Actor.create(name: "Tom Hardy", character_name: "Alfie Simon")
nate = Actor.create(name: "Robbie Amell", character_name: "Nathan Brown")
aang = Actor.create(name: "Zach Eisen", character_name: "Aang")
james = Actor.create(name: "Tom Hardy", character_name: "James Keziah Delaney")
fire = Actor.create(name: "Robbie Amell", character_name: "Firestorm")

#show - title and director
pb = Show.create(name: "Peaky Blinders", director_name: "Otto Bathurst")
upload = Show.create(name: "Upload", director_name: "Greg Daniels")
avatar = Show.create(name: "Avatar: The Last Airbender", director_name: "Giancarlo Volpe")
taboo = Show.create(name: "Taboo", director_name: "Kristoffer Nyholm")
flash = Show.create(name: "The Flash", director_name: "Glen Winter")

#role - show_id + actor_id
pb1 = Role.create(show_id: pb.id, actor_id: tommy.id)
pb2 = Role.create(show_id: pb.id, actor_id: alfie.id)
up1 = Role.create(show_id: upload.id, actor_id: nate.id)
av1 = Role.create(show_id: avatar.id, actor_id: aang.id)
tab1 = Role.create(show_id: taboo.id, actor_id: james.id)
flash1 = Role.create(show_id: flash.id, actor_id: fire.id)

#review - role_id + review 
pbrev1 = Review.create(role_id: pb1.id, review: "This show is great!")
pbrev2 = Review.create(role_id: pb2.id, review: "I wish there was more Alfie...")
uprev1 = Review.create(role_id: up1.id, review: "Greg Daniels has done it again!")
avrev1 = Review.create(role_id: av1.id, review: "The plot is better than game of thrones, no joke.")
tabrev1 = Review.create(role_id: tab1.id, review: "Tom Hardy has had better work, that's for sure.")
flashrev1 = Review.create(role_id: flash.id, review: "This show is such hot garbage...")

