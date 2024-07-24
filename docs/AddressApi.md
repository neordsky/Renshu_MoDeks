# Address Api

## Create Address Api
Endpoint : POST /api/contact/:ContactId/addresses

Headers :
- Authorization : token

Request Body :
```json
{
  "Street" : "(Street)?",
  "City" : "(City)?",
  "Province" : "(Province)?",
  "Country" : "(Country)?",
  "Postal_code" : "(Postal_code)?"
}
```

Response Body Succes :
```json
{
  "data": {
    "Id" : "(AutoIncrement)",
    "Street" : "(Street)?",
    "City" : "(City)?",
    "Province" : "(Province)?",
    "Country" : "(Country)?",
    "Postal_code" : "(Postal_code)?"

  }
}
```

Response Body Error :
```json
{
  "Error": "Country is required"
}
```

## Get Adddress Api
Endpoint : GET /api/contact/:ContactId/addresses/address:Id

Headers :
- Authorization : token



Response Body Succes :
```json
{
  "data": [{
    "Id" : "(AutoIncrement)",
    "Street" : "(Street)?",
    "City" : "(City)?",
    "Province" : "(Province)?",
    "Country" : "(Country)?",
    "Postal_code" : "(Postal_code)?"

  }]
}
```

Response Body Error :
```json
{
  "Error": "Contact is Not Found..!"
}
```


## Update Address Api
Endpoint : PUT /api/contact/:ContactId/addresses/:addressId

Headers :
- Authorization : token

equest Body :
```json
{
  "Street" : "(Street)?",
  "City" : "(City)?",
  "Province" : "(Province)?",
  "Country" : "(Country)?",
  "Postal_code" : "(Postal_code)?"
}
```

Response Body Succes :
```json
{
  "data": {
    "Id" : "(AutoIncrement)",
    "Street" : "(Street)?",
    "City" : "(City)?",
    "Province" : "(Province)?",
    "Country" : "(Country)?",
    "Postal_code" : "(Postal_code)?"

  }
}
```

Response Body Error :
```json
{
  "Error": "Country is required"
}
```


## List Addresses Api
Endpoint : GET /api/contact/:ContactId/addresses

Headers :
- Authorization : token



Response Body Succes :
```json
{ 
     "data": [
        {
    "Id" : "(AutoIncrement)",
    "Street" : "(Street)?",
    "City" : "(City)?",
    "Province" : "(Province)?",
    "Country" : "(Country)?",
    "Postal_code" : "(Postal_code)?"

  }
      {
    "Id" : "(AutoIncrement)",
    "Street" : "(Street)?",
    "City" : "(City)?",
    "Province" : "(Province)?",
    "Country" : "(Country)?",
    "Postal_code" : "(Postal_code)?"

  }
  ]

}
```

Response Body Error :
```json
{
  "Error" : "Contact Not Found..!"
}
```


## Remove Address Api
Endpoint : DELETE /api/contact/:ContactId/addresses/:addressId

Headers :
- Authorization : token
:

Response Body Succes :
```json
{
  "Success": "Contact Has Remove"
}
```

Response Body Error :
```json
{
 "Error": "Contact is not found..!"
}
```
