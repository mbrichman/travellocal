# encoding: utf-8
# Autogenerated by the db:seed:dump task
# Do not hesitate to tweak this to your needs

City.create([
  { :name => "Chicago", :created_at => "2013-05-21 01:45:45", :updated_at => "2013-05-21 01:45:45" },
  { :name => "New York", :created_at => "2013-05-21 01:45:52", :updated_at => "2013-05-21 01:45:52" },
  { :name => "Los Angeles", :created_at => "2013-05-21 01:45:57", :updated_at => "2013-05-21 01:45:57" },
  { :name => "San Francisco", :created_at => "2013-05-21 01:46:03", :updated_at => "2013-05-21 01:46:03" },
  { :name => "Houston", :created_at => "2013-05-21 01:46:08", :updated_at => "2013-05-21 01:46:08" },
  { :name => "Las Vegas", :created_at => "2013-05-21 01:46:14", :updated_at => "2013-05-21 01:46:14" },
  { :name => "Phoenix", :created_at => "2013-05-21 01:46:19", :updated_at => "2013-05-21 01:46:19" }
], :without_protection => true )



Connection.create([
  { :user_id => 1, :connection_id => 2, :created_at => "2013-05-20 23:21:55", :updated_at => "2013-05-20 23:21:55" },
  { :user_id => 1, :connection_id => 3, :created_at => "2013-05-20 23:22:27", :updated_at => "2013-05-20 23:22:27" },
  { :user_id => 2, :connection_id => 4, :created_at => "2013-05-21 01:18:44", :updated_at => "2013-05-21 01:18:44" },
  { :user_id => 2, :connection_id => 5, :created_at => "2013-05-21 01:18:45", :updated_at => "2013-05-21 01:18:45" },
  { :user_id => 10, :connection_id => 1, :created_at => "2013-05-21 02:49:24", :updated_at => "2013-05-21 02:49:24" },
  { :user_id => 10, :connection_id => 2, :created_at => "2013-05-21 02:49:28", :updated_at => "2013-05-21 02:49:28" },
  { :user_id => 5, :connection_id => 7, :created_at => "2013-05-21 17:58:29", :updated_at => "2013-05-21 17:58:29" },
  { :user_id => 5, :connection_id => 8, :created_at => "2013-05-21 17:58:55", :updated_at => "2013-05-21 17:58:55" }
], :without_protection => true )



Place.create([
  { :city_id => 1, :name => "Revolution Brewing", :address => "2323 N. Milwaukee Ave. Chicago, IL 60647", :url => "www.revbrew.com", :neighborhood => "Logan Square", :created_at => "2013-05-21 01:57:44", :updated_at => "2013-05-21 01:57:44" },
  { :city_id => 1, :name => "Longman & Eagle", :address => "2657 N Kedzie Ave  Chicago, IL 60647", :url => "www.longmanandeagle.com", :neighborhood => "Logan Square", :created_at => "2013-05-21 02:00:39", :updated_at => "2013-05-21 02:00:39" },
  { :city_id => 1, :name => "Telegraph", :address => "2601 N Milwaukee Ave, Chicago 60647", :url => "www.telegraphchicago.com", :neighborhood => "Logan Square", :created_at => "2013-05-21 02:01:20", :updated_at => "2013-05-21 02:01:20" },
  { :city_id => 1, :name => "Yusho", :address => "2853 N Kedzie Ave., Chicago IL", :url => "yusho-chicago.com", :neighborhood => "Avondale", :created_at => "2013-05-21 02:02:01", :updated_at => "2013-05-21 02:02:24" }
], :without_protection => true )



Review.create(:category => "", :place_id => 1, :review_text => "I love this place. The burgers are fantastic and there is always a rotating selection of beers that are top notch.", :review_date => "2013-05-21", :user_id => 1, :created_at => "2013-05-21 02:06:17", :updated_at => "2013-05-21 02:06:17" ),
  { :category => "", :place_id => 4, :review_text => "This is probably my favorite restaurant in the city right now. The concept is Japanese street food. The dishes are original and unusual and the execution is fantastic. Their cocktail program is great.\r\n\r\nA definite 'do not miss'!", :review_date => "2013-05-21", :user_id => 2, :created_at => "2013-05-21 02:08:21", :updated_at => "2013-05-21 02:08:21" },
  { :category => "", :place_id => 3, :review_text => "Great place to go when you're looking for good food and good wine. The food is a mix of small plates and typical entrees. They also really know their wines and the staff is always ready to suggest a great pairing with your meal. \r\n\r\nTheir chicken dish, which always changes, is always fantastic!", :review_date => "2013-05-21", :user_id => 5, :created_at => "2013-05-21 02:13:16", :updated_at => "2013-05-21 02:13:16" },
  { :category => "", :place_id => 2, :review_text => "The sausages are good!", :review_date => "2013-05-21", :user_id => 10, :created_at => "2013-05-21 02:49:15", :updated_at => "2013-05-21 02:49:15" }
], :without_protection => true )



User.create([
  { :email => "mbrichman@yahoo.com", :password_digest => "$2a$10$ZWGofvoan64CaHTvrMRUGOyrVHefhZ7kB6Zl3E1MwIxOAjDqUUKhu", :created_at => "2013-05-20 22:52:41", :updated_at => "2013-05-22 02:03:57", :name => "Mark" },
  { :email => "", :password_digest => "$2a$10$Mf4J/PMgbWFcHywNAl9Y7OZZpAfKLUrJ8WGJlp6HtmoJv4FZnNEsG", :created_at => "2013-05-20 23:01:58", :updated_at => "2013-05-20 23:01:58", :name => "Sam" },
  { :email => "", :password_digest => "$2a$10$WgxzZvMBIV8/uxAdmdm2jeRdEneUrg7tJF5WQlUBs6PvAlVeL34dy", :created_at => "2013-05-20 23:02:09", :updated_at => "2013-05-20 23:02:09", :name => "Sally" },
  { :email => "", :password_digest => "$2a$10$FsHVI61Jjte9nsX8UeJBUuRKMmFrFSNBc24pZHbbYcgkmTp4JOxFG", :created_at => "2013-05-20 23:02:19", :updated_at => "2013-05-20 23:02:19", :name => "Gretta" },
  { :email => "", :password_digest => "$2a$10$F/FOFp/cXgyc247tNHYi.uGGZFvEKvcfMUn6sinhXx658YnABtwOC", :created_at => "2013-05-20 23:02:26", :updated_at => "2013-05-20 23:02:26", :name => "Jack" },
  { :email => "", :password_digest => "$2a$10$gOSir7P0FVqpHlncPo8C7uaycRrI4/EPWYvsBOFimUZwHh.pBkNzq", :created_at => "2013-05-20 23:02:36", :updated_at => "2013-05-20 23:02:36", :name => "Bill" },
  { :email => "", :password_digest => "$2a$10$xcVtKp9c9NWkh/lbjjo1W.rGalLnMaqiVbcIp0yi62o/Xsj34gELq", :created_at => "2013-05-20 23:02:46", :updated_at => "2013-05-20 23:02:46", :name => "Babette" },
  { :email => "", :password_digest => "$2a$10$YEiX7wrTtfsr8n/TNUuDhuv.9GJk9tH3byT.F26nLSX99YrebIhcO", :created_at => "2013-05-20 23:03:02", :updated_at => "2013-05-20 23:03:02", :name => "Lisa" },
  { :email => "", :password_digest => "$2a$10$fcPdFW8SI.yVYPb/gaKsM.d.I/wUPKL4PFNG3j.jWiDxIc9a2gb7u", :created_at => "2013-05-20 23:03:09", :updated_at => "2013-05-20 23:03:09", :name => "Mike" },
  { :email => "clraso@yahoo.com", :password_digest => "$2a$10$ibCp7.RMuyCVvvxq/.2Pxu2fJeF6y5Q47ylpWPX0/tGZ8Q83Igs4i", :created_at => "2013-05-21 02:48:38", :updated_at => "2013-05-21 02:48:38", :name => "Claudia" }
], :without_protection => true )


