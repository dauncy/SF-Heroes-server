# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'
require 'pry'



cases = RestClient.get("https://data.sfgov.org/resource/vw6y-z8j6.json")
cases_array = JSON.parse(cases)
new_cases = [ ]
cases_array.each do |event|
   if  event["status_notes"] == "open"
    new_cases.push(event)
   end 
  
end

new_cases.each do |object| 
    if object["media_url"] != nil
    CommunityEvent.create(
        sf_data_reference: object["service_request_id"],
        district: object["neighborhoods_sffind_boundaries"],
        title: object["service_name"],
        status: object["status_description"],
        service_subtype: object["service_subtype"],
        service_details: object["service_details"],
        address: object["address"],
        latitude: object["lat"],
        longitude: object["long"],
        media_url: object["media_url"]["url"]
    )
    else 
        CommunityEvent.create(
            sf_data_reference: object["service_request_id"],
            title: object["service_name"],
            district: object["neighborhoods_sffind_boundaries"],
            status: object["status_description"],
            service_subtype: object["service_subtype"],
            service_details: object["service_details"],
            address: object["address"],
            latitude: object["lat"],
            longitude: object["long"],
            media_url: "http://localhost:3000/assets/communism.png")
    end 
end 
