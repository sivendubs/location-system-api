Feature: Testing the API's

Scenario: Get postalCodes details
Given I create a new request with http://localhost:8082/api/ service
And I add the /location/postalCodes?address=Leeds endpoint to the service
And I send the GET request to the service
Then I get the 200 response code

Scenario: Get attractionsSpot details
Given I create a new request with http://localhost:8082/api/ service
And I add the /location/attractionspots?address=Leeds endpoint to the service
And I send the GET request to the service
Then I get the 200 response code

Scenario: Get nearbyStation details
Given I create a new request with http://localhost:8082/api/ service
And I add the /location/stations?address=Leeds endpoint to the service
And I send the GET request to the service
Then I get the 200 response code
