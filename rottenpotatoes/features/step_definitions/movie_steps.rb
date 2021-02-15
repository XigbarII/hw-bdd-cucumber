# Add a declarative step here for populating the DB with movies.
#byebug
Movie.delete_all
#movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
#     	    {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984'},
#    	    {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
#      	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
#      	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001'},
#      	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001'},
#      	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968'},
#      	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
#      	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
#      	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000'},
#  	 ]

#movies.each do |movie|
#  Movie.create!(movie)
#end
#byebug
Given /the following movies exist/ do |movies_table|
  #byebug
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    if Movie.find_by(title: movie[title]).nil?
      mov = Movie.new
      mov.title = movie["title"]
      mov.rating = movie["rating"]
      mov.release_date = movie["release_date"]
      mov.save
    end
  end
  #fail "Unimplemented"
end

Then /(.*) seed movies should exist/ do | n_seeds |
  #byebug
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  fail "Unimplemented"
end
