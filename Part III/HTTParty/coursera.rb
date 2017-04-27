require 'httparty'
require 'pp'

class Coursera
  include HTTParty

  base_uri 'https://api.coursera.org/api/catalog.v1/courses'
  default_params fields: "smallIcon,shortDescription", q: "search"
  format :json

  def self.for term
    get("", query: { query: term})["elements"]
  end
end

courses = Coursera.for "python"
courses.each do |course|
  puts "- #{course["name"]}: #{course["shortDescription"]}\n"
end

pp courses
