# User Api Spech

## Register User Api

EndPoint : POST /api/usersreg

request body :
```json
{
    "Id" : "000",
    "Username": "Hao Yue",
    "Password": "Lei tian di" 
}
```
respone body succes : 
```json
{    
    "data" : {
    "Id" : "000",
    "Username": "Hao Yue",
    },

    "succes":"True"
}
```
respone body error :
```json
{
   "error" : "Username already Registered",
   "error": "True"
}
```
## Login User Api
 Endpoint : POST /api/users/login

 Respone body :

```json
{
   "Id": "000",
   "Username" : "Hao Yue",
   "Password": "Himitsu"
}
```
Respone body succes :

```json
{
  "data":{
    "token": "unique-token"
  }
}
```
Respone body error :

```json
{
  "error": "Username or Password is wrong..!"
}
```


## Update User Api
Endpoint : PATCH /api/users/current

Headers : 
- Authorization : token

Request body :

```json
{
   "Username" : "Hao Yue",
   "Password" : "Himitsu"
}
```

Response body succes : 

```json
{
   "data" : {
   "Username" : "Hao Yue",
   "Password" : "Himitsu"
   },
   "Succes" : "True"
}
```

Response body error :

```json
{
   "error": "Username length max 100 word"
}
```

## Get User Api
Endpoint : GET /api/users/get

Headers :
- Authorization : token

Response Body succes :

```json
{
    "data": {
    "Id" : "000",
    "Username": "Hao Yue",
    "Password": "Lei tian di" 
    }
}
```

Response Body error :

```json
{
    "error" : "Unauthorized"
}
```


## Logout User Api
Endpoint : DELETE /api/users/logout

Headers :
-Authorization : token

Respone body succes :

```json
{
  "data" : "Succes logout"
}
```

Respone body error :

```json
{
  "error" : "You must register your account/Unauthorized"
}
```