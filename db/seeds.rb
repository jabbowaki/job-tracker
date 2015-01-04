# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

emily = User.create!(first_name: "Emily", last_name:"Owaki", email: "emily.owaki@gmail.com", password: "catscats")

devmynd = Opportunity.create!(user: emily, name: "DevMynd", website: "https://www.devmynd.com/",career_page:"https://www.devmynd.com/jobs/apprenticeship")

fakeropp = Opportunity.create!(user: emily, name: "faker job", website: "https://www.fakerjob.com/",career_page:"https://www.fakerjob.com/jobs")

sasha = Advocate.create!(name: "Sasha", email: "sasha@gmail.com", twitter: "SassyGrody", opportunity: devmynd)

fakeradvocate = Advocate.create!(name: "faker name", email: "email@gmail.com", twitter: "twitter_name", opportunity: fakeropp)

fakeradvocate1 = Advocate.create!(name: "ewfw name", email: "gmail@gmail.com", twitter: "twitter_name_other", opportunity: fakeropp)

action1 = Action.create!(description: "Coffee date",
                          opportunity: devmynd,
                          advocate: sasha,
                          meeting_date: "2014-12-25",
                          reached_out: "2014-12-18",
                          follow_up: "2014-12-26",
                          notes: "Tweeted at DevMynd thanking them for letting me hangout durring standup and asking about when they'll be opening up applications for apprenticeships. Didn't get a reply, but they'll probably be hiring in the next month or two per Sasha.")

action2 = Action.create!(description: "Phone Interview",
                          opportunity: devmynd,
                          advocate: sasha,
                          meeting_date: "2015-1-10",
                          reached_out: "2014-12-31",
                          follow_up: "2014-12-26",
                          notes: "Don't mess this up")

action4 = Action.create!(description: "Coffee date",
                          opportunity: fakeropp,
                          advocate: fakeradvocate,
                          meeting_date: "2015-1-08",
                          reached_out: "2014-12-25",
                          follow_up: "2014-12-26",
                          notes: "That awsome coffe shop that I go to all the time. fakeradvocate loves this place so it's something we can talk about")
