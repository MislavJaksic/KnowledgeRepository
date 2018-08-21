## [Redis](https://redis.io/)

A NoSQL DB, a key-value store.

All keys must be unique.

### Commands

SET server:name "fido" // -> value: fido; key: server:name
GET server:name // -> fido
DEL server:name
SETNX server:name "bravo" // -> SET-if-not-exist

SET connections 2
INCR connections // -> atomic increment (no collisions)

SET resource:lock "Redis Demo"
EXPIRE resource:lock 120 // -> delete after 120 sec
TTL resource:lock // -> remaining lifetime: X is a number, -1 never expires, -2 is expires

//List
RPUSH || LPUSH friends "Alice"
RPUSH || LPUSH friends "Bob"
LPOP || RPOP friends
LRANGE 0 1// -> return a subset: Alice, Bob
LLEN friends // -> length

//Set
SADD superpowers "flight"
SREM superpowers //-> removes a value
SISMEMBER superpowers "reflexes" // -> if in set: 0 no, 1 yes
SMEMBERS superpowers // -> return all members of a set
SUNION superpower birdpower // -> combine sets without duplicates and returns a list

//Ordered sets
//  Each entry has a value and a score by with it will sort

//Hashes
HSET user:1000 name "John Smith" // -> map between string field and value 
HSET user:1000 email "john.smith@example.com"
HSET user:1000 password "s3cret"
HGETALL user:1000 // -> get from hash
//there are a lot of hash commands
