%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "stationName": "Salford Crescent Railway Station",
    "postCode": "M5 4BR",
    "lat": 53.4855201,
    "lon": -2.27534075,
    "city": "Salford"
  }
])