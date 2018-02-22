# Score Card Service

This service requires Elixir 1.5 and Phoenix 1.3 or higher 

To test Score Card Server:
  * Install dependencies with `mix deps.get`
  * Run test with `mix test`

To run Score Card Server:
  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`
  * Query the routes with `mix phx.routes`
  
Usage of this service:
  Two endpoints are provided to query scorecard for a given user.  
  
  * http://localhost:4000/api/scorecards/:user/
    * Example: http://localhost:4000/api/scorecards/achan-petpartners/
    * This returns the total score for a given user.
    
  * http://localhost:4000/api/scorecards/:user/:event_type
    * Example http://localhost:4000/api/scorecards/achan-petpartners/PushEvent
    * This returns the total score for a given user and event type.
  
  * To query them, 
    * curl http://localhost:4000/api/scorecards/achan-petpartners/
    * curl http://localhost:4000/api/scorecards/achan-petpartners/PushEvent
    
Field Definition:
  * scorecard - scorecard starting from this field 
  * total_score - total score for a request
  * user - the user of a scorecard for a request
  * event_type - the event type of a scorecard for a request
   
Status Codes:
  * 200 - Received, accepted, understood a request
  * 404 - Page including a user not found
  * 403 - Rate limit reached
    
Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
