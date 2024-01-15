# REST Client tests on https://github.com/tronalddump-io/tronald-app
$baseUrl=https://api.tronalddump.io

### Get a random clever quote
$response=Invoke-WebRequest -Method Get -Uri $baseurl/random/quote #https://api.tronalddump.io
write-host $response
# Accept: application/hal+json