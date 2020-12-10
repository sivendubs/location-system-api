# location-system-api


## About the project:


Location-system-api gives the set of nearyby stations, leisure-spots and set of postal codes based on the postal code / station names passed.


## The List of End-points:


-> To get the nearby stations:
     

    : http://location-system-api.us-e2.cloudhub.io/api/locations/postalCodes
    
    queryParam to be passed: address  (eg: Leeds)
    
    
-> To get the nearby attraction spots:

     : http://location-system-api.us-e2.cloudhub.io/api/locations/attractionspots
     
    queryParam to be passed: address   (eg: London Waterloo)
    
-> To get the set of postal codes:

     : http://location-system-api.us-e2.cloudhub.io/api/locations/stations
     
    queryParam to be passed: address     (eg: Woking)
    
## External Endpoint

This project uses the GeoApify an external API to get the geocode and related information. To access the service first user must register for the service in https://apidocs.geoapify.com/. 
Then user need to create a project. On project creation it genereates API KEY which will be used to access the API services.

This project implements two APIs.
- Geocoding API:  It is used to get the geo-coordinates of the input station name
     
     Syntax: 

          https://api.geoapify.com/v1/geocode/search?text={search criteria}&apiKey=YOUR_API_KEY
          
 - Place API: It is used to get the inforamation about place like tourist attaraction sites, supermarkets, station location, etc.
 
     Syntax:
          https://api.geoapify.com/v2/places?{filters}&apiKey=YOUR_API_KEY
          
     Filters: User can filter data based on various query parameters. Some of the mandatory parameters are: categories, bias, and apiKey.
     The optional parameters are: conditions, limit, name, lang, ets. Details are in the API documentation page. Refer https://apidocs.geoapify.com/docs/places/getting-started/places
     
     
