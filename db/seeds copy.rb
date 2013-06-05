# encoding: utf-8
# Autogenerated by the db:seed:dump task
# Do not hesitate to tweak this to your needs
Category.destroy_all

Category.create([
  { :name => "events"},
  { :name => "dining"},
  { :name => "nightlife"},
  { :name => "activities"},
  { :name => "shopping"},
  { :name => "outdoors"},
  { :name => "specialties"},
  { :name => "hotels" }
], :without_protection => true )
puts "#{Category.count} categories were created"

City.destroy_all
City.create([
  { :name => "Chicago"},
  { :name => "New York"},
  { :name => "Los Angeles"},
  { :name => "San Francisco"},
  { :name => "Houston"},
  { :name => "Las Vegas"},
  { :name => "Phoenix" }
], :without_protection => true )
puts "#{City.count} cities were created"


User.destroy_all
User.create([
  { :email => "mbrichman@yahoo.com", :password_digest => "$2a$10$WfwjKm7f0renkt4263SyPesmw1BgWj39ex5QD5U2fI4MxMMGsJACi", :name => "mark", :city_id => 1 },
  { :email => "claudia@me.com", :password_digest => "$2a$10$opsYlI5iEoN.UV/U4fh8ZOum7HYEt/tIAb8KRwb9bHjqVgEhIuLLC", :name => "claudia", :city_id => 4 },
  { :email => "bill@me.com", :password_digest => "$2a$10$jeLDEOGqlCo6vB9V3zXsHefeRbQLojNcg8O8UBy1C4kmJlnVKRfcu", :name => "bill", :city_id => 1 },
  { :email => "alex@me.com", :password_digest => "$2a$10$Mgc0qk0CZurMPifNrZppFOOOZ49elBkHDMufEBBhxbfUPx7zOPqxi", :name => "alex", :city_id => 3 },
  { :email => "sabrina@me.com", :password_digest => "$2a$10$sGG0XmA1IIUzfAM1A/l0keEli.Oo8Fi4kQ.yFPrcwuiI.ZoAZ3fIK", :name => "sabrina", :city_id => 1 },
  { :email => "dar@gmail.com", :password_digest => "$2a$10$mSArkESnaQBtu7e1yq/WHuChcJiltNDSg0in0J/Vth1SjOiWm9WFu", :name => "darlene", :city_id => 1 },
  { :email => "mike@gmail.com", :password_digest => "$2a$10$.yRDPAGdgC.S8jucD3y2auhsaQ39d2q2AZFaf.sgEfkf3WAaP38BG", :name => "mike", :city_id => 1 }
], :without_protection => true )
puts "#{User.count} users were created"


Place.destroy_all
Place.create([
  { :city_id => 1, :name => "revolution brewing", :address => "2323 n. milwaukee ave. chicago, il 60647", :url => "www.revbrew.com", :neighborhood => "logan square", :category_id => 2, :description => "Revolution Brewing is Chicago's new hometown craft brewery. Our brewpub in Logan Square is a bustling, neighborhood institution where friends and families meet to enjoy the freshest beer in town. Opening our brewery has been a labor of love. We think you can see that in everything we do ranging from the details of our carved fists holding up our mahogany bar to the pungent hop aroma of our Anti-Hero IPA to our creative dishes like our bacon-fat popcorn.", :photo_file_name => "MugClub.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 104214, :photo_updated_at => "2013-06-01 23:54:23" },
  { :city_id => 1, :name => "longman & eagle", :address => "2657 n kedzie ave  chicago, il 60647", :url => "www.longmanandeagle.com", :neighborhood => "logan square", :category_id => 2, :description => "Longman & Eagle chef Jared Wentworth uses traditional cooking techniques when executing his regional American fare, with emphasis on sourcing the finest local ingredients the region has to offer. This farm to table, nose to tail aesthetic is represented lovingly by ever-changing menus that are both adventurous and sublime, featuring items that exemplify his passion for creative, flavorful and honest dishes offered at fair and reasonable prices.", :photo_file_name => "longman.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 196544, :photo_updated_at => "2013-06-02 00:05:00" },
  { :city_id => 1, :name => "telegraph", :address => "2601 n milwaukee ave, chicago 60647", :url => "www.telegraphchicago.com", :neighborhood => "logan square", :category_id => 2, :description => "Located in the heart of Logan Square, Telegraph is Chicago’s natural wine bar. Our focus is pairing a unique, often rare, European wines, curated by sommelier Jeremy Quinn, with seasonal, inventive cuisine crafted by chef Johnny Anderes.", :photo_file_name => "sign-web.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 461794, :photo_updated_at => "2013-06-01 23:55:42" },
  { :city_id => 1, :name => "yusho", :address => "2853 n kedzie ave., chicago il", :url => "yusho-chicago.com", :neighborhood => "avondale", :category_id => 2, :description => "Street food is the great equalizer—no glamour required. Yakitori, when well-executed, is about the simple flavors of authentic street food. A hot grill provides intense flavors from seasonal proteins and vegetables, grilled to order over a chattering, hissing fire.\r\n\r\nBeer, wine and sake selections compliment the fresh-grilled flavors. Craft cocktails, wines and spirits are chosen for customized meal pairings. Experiment and discover!", :photo_file_name => "2x-fried-chicken.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 144522, :photo_updated_at => "2013-06-02 00:06:46" },
  { :city_id => 1, :name => "lula cafe", :address => "2537 n kedzie blvd, chicago, il 60647", :url => "lulacafe.com", :neighborhood => "logan square", :category_id => 2, :description => "On September 2, 1999, Lula Cafe opened in a small storefront on Kedzie Boulevard with a four burner home stove and a dented batterie of thrifted pots and pans. Today, stretching three storefronts, it is the founding member of the nationally recognized Logan Square culinary community and a celebrated forerunner of the ‘farm to table’ movement in Chicago.\r\n\r\nWith self taught chefs and a willingness to cook against categorization, the menu at Lula has grown into a kind of humble maturity, risky but grounded, a boheme bistro of the unclassifiable kind. We want you to come for all occasions, to read a book at the bar with a glass of wine, to celebrate birthdays and first dates, to taste through the seasons, to brunch with friends after a night out. Anything is possible, welcomed, wished for, here at Lula.", :photo_file_name => "food_5.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 63966, :photo_updated_at => "2013-06-02 00:02:39" },
  { :city_id => 4, :name => "slanted door", :address => "1 ferry building #3 san francisco, ca 94111", :url => "www.slanteddoor.com", :neighborhood => "downtown", :category_id => 2, :description => "For every item on our menu, Executive Chef, Charles Phan goes to the original source region of that item. He studies the traditional ingredients, flavors and techniques, then retreats to his Mission district test kitchen, where he and his team recreate the original using contemporary methods and the finest and freshest local ingredients. The finished product is a faithful reproduction of a world classic, modernized in subtle yet powerful ways.", :photo_file_name => "l.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 60709, :photo_updated_at => "2013-06-02 00:09:20" },
  { :city_id => 1, :name => "balena", :address => "1633 n.halsted", :url => "balenachicago.com", :neighborhood => "lincoln park", :category_id => 2, :description => "", :photo_file_name => "Balena.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 101478, :photo_updated_at => "2013-06-02 15:08:55" },
  { :city_id => 1, :name => "oz park", :address => "2021 n. burling", :url => "www.chicagoparkdistrict.com/parks/Oz-Park/", :neighborhood => "lincoln park", :category_id => 6, :description => "", :photo_file_name => "tinman_ozpark.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 29137, :photo_updated_at => "2013-06-02 00:13:22" },
  { :city_id => 1, :name => "tarantinos", :address => "1112 armitage avenue", :url => "www.taratinos.com", :neighborhood => "lincoln park", :category_id => 1, :description => "", :photo_file_name => "2013-03-27_14.10.37.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 145851, :photo_updated_at => "2013-06-02 15:10:15" },
  { :city_id => 1, :name => "gemini bistro", :address => "2075 n. lincoln avenue", :url => "www.geminibistrochicago.com", :neighborhood => "lincoln park", :category_id => 1, :description => "", :photo_file_name => "Gemini_Bistro.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 118342, :photo_updated_at => "2013-06-02 15:14:28" },
  { :city_id => 1, :name => "floriole cafe & bakery", :address => "1220 w. webster", :url => "www.floriole.com", :neighborhood => "lincoln park", :category_id => 1, :description => "", :photo_file_name => "Floriole_Cafe___Bakery.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 154873, :photo_updated_at => "2013-06-02 15:07:28" },
  { :city_id => 1, :name => "lori's designer shoes", :address => "824 armitage avenue", :url => "www.lorisshoes.com", :neighborhood => "lincoln park", :category_id => 5, :description => "", :photo_file_name => "bedb3a4302e3974fe871021529ddb86.jpeg", :photo_content_type => "image/jpeg", :photo_file_size => 16962, :photo_updated_at => "2013-06-02 00:12:21" },
  { :city_id => 1, :name => "art effect", :address => "934 west armitage", :url => "www.shoparteffect.com", :neighborhood => "lincoln park", :category_id => 7, :description => "", :photo_file_name => "header-logo.gif", :photo_content_type => "image/gif", :photo_file_size => 3367, :photo_updated_at => "2013-06-02 00:14:02" },
  { :city_id => 1, :name => "hotel lincoln", :address => "1816 n. clark", :url => "www.jdvhotels.com/hotels/illinois/chicago-hotels/hotel-lincoln", :neighborhood => "lincoln park", :category_id => 8, :description => "", :photo_file_name => "hotel-lincoln-front-desk.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 90547, :photo_updated_at => "2013-06-02 00:14:41" },
  { :city_id => 1, :name => "lincoln park zoo", :address => "2001 n. clark street", :url => "www.lpzoo.com", :neighborhood => "lincoln park", :category_id => 4, :description => "", :photo_file_name => "lincoln_park_zoo.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 84821, :photo_updated_at => "2013-06-02 00:10:40" },
  { :city_id => 1, :name => "chicago history museum", :address => "1601 n. clark street", :url => "www.chicagohs.com", :neighborhood => "old town", :category_id => 1, :description => "", :photo_file_name => "Chicago_History_Museum.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 115244, :photo_updated_at => "2013-06-02 15:13:50" },
  { :city_id => 1, :name => "lincoln avenue live", :address => "700 w. belden avenue", :url => "www.chicagoevents.com/event.cfm?eid=280", :neighborhood => "lincoln park", :category_id => nil, :description => nil, :photo_file_name => nil, :photo_content_type => nil, :photo_file_size => nil, :photo_updated_at => nil },
  { :city_id => 1, :name => "blues fest", :address => "337 e. randolph street", :url => "chicago.metromix.com/events/mmxchi-chicago-blues-festival-event", :neighborhood => "grant park", :category_id => 1, :description => "", :photo_file_name => "22_Chicago_Blues_Festival.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 52060, :photo_updated_at => "2013-06-02 00:10:25" },
  { :city_id => 1, :name => "taco joint, urban taqueria", :address => "1969 n. halsted", :url => "www.tacojoint.com", :neighborhood => "lincoln park", :category_id => 1, :description => "", :photo_file_name => "Taco_Joint_Urban_Taqueria___Cantina.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 61970, :photo_updated_at => "2013-06-02 15:12:38" },
  { :city_id => 1, :name => "rustic house", :address => "1967 n. halsted", :url => "www.rustichousechicago.com", :neighborhood => "lincoln park", :category_id => 1, :description => "", :photo_file_name => "Rustic_House.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 74970, :photo_updated_at => "2013-06-02 15:11:42" },
  { :city_id => 1, :name => "twin anchors", :address => "1655 n. sedgwick", :url => "www.twinanchorsribs.com", :neighborhood => "old town", :description => "", :photo_file_name => "Twin_Anchors.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 128931, :photo_updated_at => "2013-06-02 15:11:02" },
  { :city_id => 1, :name => "second city", :address => "1616 n. wells", :url => "www.secondcity.com", :neighborhood => "old town", :category_id => 4, :description => "", :photo_file_name => "secondcity1.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 42147, :photo_updated_at => "2013-06-02 00:11:16" }
], :without_protection => true )
puts "#{Place.count} places were created"



Review.destroy_all
Review.create([
  { :category => "dining", :place_id => 1, :review_text => "I love this place. The burgers are fantastic and there is always a rotating selection of beers that are top notch.", :review_date => "2013-05-22", :user_id => 1},
  { :category => "dining", :place_id => 4, :review_text => "This is probably my favorite restaurant in the city right now. The concept is Japanese street food. The dishes are original and unusual and the execution is fantastic. Their cocktail program is great.\r\n\r\nA definite 'do not miss'!", :review_date => "2013-05-22", :user_id => 1},
  { :category => "dining", :place_id => 3, :review_text => "Great place to go when you're looking for good food and good wine. The food is a mix of small plates and typical entrees. They also really know their wines and the staff is always ready to suggest a great pairing with your meal.\r\n\r\nTheir chicken dish, which always changes, is always fantastic!", :review_date => "2013-05-22", :user_id => 5},
  { :category => "dining", :place_id => 2, :review_text => "The sausage shop around back has good stuff.", :review_date => "2013-05-22", :user_id => 12},
  { :category => "dining", :place_id => 4, :review_text => "The Miyataki mushrooms are one of my favorite dishes of all time!", :review_date => "2013-05-28", :user_id => 2},
  { :category => "dining", :place_id => 1, :review_text => "Come for the food, stay for the beer", :review_date => "2013-05-28", :user_id => 3},
  { :category => "dining", :place_id => 9, :review_text => "Food, wine and service is fantastic!  Food changes seasonally and is delish...they are kid friendly as well when dining on the early side!", :review_date => "2013-06-01", :user_id => 4},
  { :category => "outdoors", :place_id => 10, :review_text => "So many fun events in Oz Park but one of my favorites is \"movies in the park\"!  Check their calendar for when and pack your picnic bag...enjoy.", :review_date => "2013-06-01", :user_id => 4},
  { :category => "dining", :place_id => 11, :review_text => "Try their daily specials, they use  fresh produce from the local farmers market and the dishes are never a disappointment...same with their daily wine special selections!  friendly neighborhood atmosphere...love it!", :review_date => "2013-06-01", :user_id => 1 }
], :without_protection => true )
puts "#{Review.count} reviews were created"


