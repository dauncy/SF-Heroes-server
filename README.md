**SF Heroes Backend**

_For a description on the frontend and user-story vist [SF-Heroes-Frontend-Repo](https://github.com/dauncy/SF-Heroes-client) or watch this [video-demo](http://youtu.be/iwxzo3kiUlk)._

Over 200 San Francisco Public Works and 311 cases were collected from the data.sfgov.org API and stored in a Ruby on Rails databse using postgresql.
Custom routes were setup for creating JWT user authentication & re-authorizing.
Custom controller actions were set up to implement query params, and render nested JSON serialization.   

***Languages and Technologies Used***
- Ruby on Rails using postgres to store SF Public Works & 311 cases and persist user-data.
- data.sfgov API for data collection
- RestClient and JSON Ruby gems implemented to parse the API JSON data and seed the database with over 200 311 cases.
- Bcrypt Ruby gem used for secure passwords
