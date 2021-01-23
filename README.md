# Samacare

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


Creating a User
```
curl -XPOST 'http://localhost:4000/api/users' \
-H "Content-type: application/json" \
-d @- << EOF
{
  "user": {
    "name": "Michael Ni"
  }
}
EOF
```

Creating a Follow
```
curl -XPOST 'http://localhost:4000/api/follows' \
-H "Content-type: application/json" \
-d @- << EOF
{
  "follow": {
    "follower_id": 1,
    "followee_id": 2
  }
}
EOF
```

Creating a Tweet
```
curl -XPOST 'http://localhost:4000/api/tweets' \
-H "Content-type: application/json" \
-d @- << EOF
{
  "tweet": {
    "message": "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
    "author_id": 1
  }
}
EOF
```