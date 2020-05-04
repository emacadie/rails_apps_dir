require 'twitter'

class TweetFactory

  def self.regular_tweet
    h = {}
    h = {  :created_at=> "Sun Jan 13 04:10:41 +0000 2013",
      :id=> 290309870257844224,
      :id_str=> "290309870257844224",
      :text=> "This is a plain tweet",
      :source=> "web",
      :truncated=> false,
      :user=> {
        :id=>169624004, 
        :id_str=>"169624004", 
        :name=>"Eric MacAdie", 
        :screen_name=>"EMacAdie2", 
        :location=>"", 
        :description=>"", 
        :url=>nil, 
        :entities=>{:description=>{:urls=>[]}}, 
        :protected=>false, 
        :followers_count=>2, 
        :friends_count=>2, 
        :listed_count=>0, 
        :created_at=>"Thu Jul 22 19:51:06 +0000 2010", 
        :favourites_count=>0, 
        :utc_offset=>nil, 
        :time_zone=>nil, 
        :geo_enabled=>false, 
        :verified=>false, 
        :statuses_count=>19, 
        :lang=>"en", 
        :contributors_enabled=>false, 
        :is_translator=>false, 
        :profile_background_color=>"C0DEED", 
        :profile_background_image_url=>"http://a0.twimg.com/images/themes/theme1/bg.png", 
        :profile_background_image_url_https=>"https://si0.twimg.com/images/themes/theme1/bg.png", 
        :profile_background_tile=>false, 
        :profile_image_url=>"http://a0.twimg.com/sticky/default_profile_images/default_profile_4_normal.png", 
        :profile_image_url_https=>"https://si0.twimg.com/sticky/default_profile_images/default_profile_4_normal.png", 
        :profile_link_color=>"0084B4", 
        :profile_sidebar_border_color=>"C0DEED", 
        :profile_sidebar_fill_color=>"DDEEF6", 
        :profile_text_color=>"333333", 
        :profile_use_background_image=>true, 
        :default_profile=>true, 
        :default_profile_image=>true, 
        :following=>nil, 
        :follow_request_sent=>false, 
        :notifications=>nil},
      :retweet_count=> 0,
      :entities=> {:hashtags=>[], :urls=>[], :user_mentions=>[]},
      :favorited=> false,
      :retweeted=> false
    }
    return h
  end

end
