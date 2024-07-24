# Contact Api

## Create Contact Api
Endpoint : POST api/contact

Headers :
- Authorization : token

Request Body :
```json 
{
   "Username" : "Lei Yue",
   "Password": "Yue dian tian",
   "Alamat": "Shanghai"
}
```
Response Body Succes:
```json
{
   "data": {
   "Id": "(AutoIncrement)",
   "Username" : "Lei Yue",
   "Password": "Yue dian tian",
   "Alamat": "Shanghai"
   }
}
```

Response Body Error :
```json
{
   "error": "Username is already..!"
}
```

## Get Contact Api
Endpoint : POST api/contact/:Id

Headers :
- Authorization : token

Response Body Succes:
```json
{
   "data": {
    "Id": "(AutoIncrement)",
    "Username" : "Lei Yue",
   "Password": "Yue dian tian",
   "Alamat": "Shanghai"
  }
}
```

Response Body Error :
```json
{
  "error": "Id Not Found..!"
}
```

## Update Contact Api
Endpoint : PUT api/contact/:Id

Headers :
- Authorization : token

Request Body :
```json 
{
  "Username" : "Lei Yue",
   "Password": "Yue dian tian",
   "Alamat": "Shanghai"
}
```
Response Body Succes:
```json
{
  "data": {
    "Id": "(AutoIncrement)",
    "Username" : "Lei Yue",
   "Password": "Yue dian tian",
   "Alamat": "Shanghai"
  }
}
```

Response Body Error :
```json
{
  "error": "Username is already..!"
}
```

## Search Contact Api
Endpoint : POST api/contact

Headers :
- Authorization : token

Query Params :
- Id : Search by Id using like
- Username : Search by Username using like
- Page : Number of Page,default 0
- Size : Size per Page,default 10 

Response Body Succes:
```json
{
   "data":[ {
    "Id": "(AutoIncrement)",
    "Username" : "Lei Yue",
   "Password": "Yue dian tian",
   "Alamat": "Shanghai"
  }
  {
    "Id": "(AutoIncrement)",
    "Username" : "tian Yue",
   "Password": "Lei dian tian",
   "Alamat": "Shanghai"
   }
   ],
   "Pagging" : {
    "Page" : 0,
    "Total_Page": 12,
    "Total_Items" : 22
   }
}
```

Response Body Error :
```json
{
  "error" : "Data Not Found..!"
}
```


## Remove Contact Api
Endpoint : POST api/contact/:Id

Headers :
- Authorization : token

Response Body Succes:
```json
{
  "Succes" : "Data Has Remove..!"
}
```

Response Body Error :
```json
{
  "error" : "Data Not Found..!"
}
```
