require 'spec_helper'
# no help
require 'active_record'
# no help
require_relative '../app/models/website'



describe WebsitePinger do

  def create_websites
    Website.create(url: "http://www.theoildrum.com/",
                   minute: 0,
                   name: "Oil Drum",
                   summary: "adf",
                   failed_tries: 0,
                   successful_tries: 0,
                   user_id: 1,
                   good_site: true)
    Website.create(url: "http://akka.io",
                   minute: 1,
                   name: "Akka",
                   summary: "A",
                   failed_tries: 0,
                   successful_tries: 0,
                   user_id: 1,
                   good_site: true)
    Website.create(url: "http://en.memory-alpha.org/wiki/Star_Trek:_Enterprise",
                   minute: 2,
                   name: 'Star_Trek: Enterprise',
                   summary: "asdf",
                   failed_tries: 0,
                   successful_tries: 0,
                   user_id: 1,
                   good_site: true)
    Website.create(url: "http://guides.rubyonrails.org",
                   minute: 3,
                   name: "Rails Guides",
                   summary: "sadf",
                   failed_tries: 0,
                   successful_tries: 0,
                   user_id: 1,
                   good_site: true)
    Website.create(url: 'http://weather.yahoo.com',
                   minute: 4,
                   name: 'Yahoo Weather',
                   summary: 'asdf',
                   failed_tries: 0,
                   successful_tries: 0,
                   user_id: 1,
                   good_site: true)
    Website.create(url: 'http://akka.io',
                   minute: 5,
                   name: 'Akka',
                   summary: 'A site for actors and concurrency',
                   failed_tries: 0,
                   successful_tries: 0,
                   user_id: 2,
                   good_site: true)
=begin    
Website url: http://www.atomicinsights.com
    minute: 4
    name: Atomic Insights
    summary: A great blog, leading us to the future.
    failed_tries: 0
    successful_tries: 0
    user_id: 3
    good_site: true
Website url: http://twitter.com/ChiRubyTest
    minute: 4
    name: Chi Ruby Test
    summary: My Twitter site
    failed_tries: 0
    successful_tries: 0
    user_id: 3
    good_site: true
Website url: http://www.voxeu.org
    minute: 5
    name: Vox
    summary: The voice of Europe
    failed_tries: 0
    successful_tries: 0
    user_id: 3
    good_site: true
Website url: http://www.nerdfitness.com
    minute: 2
    name: Nerd Fitness
    summary: Health, tech and babes
    failed_tries: 0
    successful_tries: 0
    user_id: 3
    good_site: true
=end
  end


  # before (:each) do
    # wp = WebsitePinger.instance
  # end
  let(:wp) { WebsitePinger.instance }
=begin
  it "does stuff" do
    puts "This is does stuff"
  end
=end
  it "tests ping_sites method" do
    create_websites
    wp.ping_sites
  end

  it "works with mocking" do
    double_website = double("Website")
    # puts "The methods: #{methods.sort.inspect} "
  end

  it "uses the mock array" do
    create_websites
    Website.stub(:where).and_return(Website.all)
    wp.ping_sites
  end

=begin
  it "tests do_ping method" do
    x = wp.do_ping("http://www.yahoo.com")
  end
=end
end
