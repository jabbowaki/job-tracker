# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

emily = User.create!(first_name: "Emily", last_name:"Owaki", email: "emily.owaki@gmail.com", password: "catscats")

devmynd = Opportunity.create!(user: emily, name: "DevMynd", website: "https://www.devmynd.com/",career_page:"https://www.devmynd.com/jobs/apprenticeship")

sasha = Advocate.create!(name: "Sasha", twitter: "SassyGrody")

connect1 = Connection.create!(opportunity: devmynd, advocate: sasha)

action1 = Action.create!(description: "Coffee date",
                          opportunity: devmynd,
                          advocate: sasha,
                          meeting_date: "2014-12-25",
                          reached_out: "2014-12-18",
                          follow_up: "2014-12-26",
                          notes: "Tweeted at DevMynd thanking them for letting me hangout durring standup and asking about when they'll be opening up applications for apprenticeships. Didn't get a reply, but they'll probably be hiring in the next month or two per Sasha.")