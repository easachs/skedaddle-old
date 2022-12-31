# Skedaddle

![image](https://user-images.githubusercontent.com/95776577/191402464-90f06a92-613b-4338-be41-0261f39f62e9.png)


<ul>
<li><b>Skedaddle</b> is a <b>Rails</b> travel itinerary app that creates a custom travel itinerary for a budgeted, eco-friendly weekend for a given location. It is the continued solo exploration of a past group project.</li>

<li>This iteration of <b>Skedaddle</b> combines the group project's front end and back end service-oriented architecture into a single monolith application.</li>

<li>It consumes API endpoints from <b>Yelp</b> (restaurants), <b>TrailAPI</b> (trails/parks), and <b>PositionStack</b> (geocoding).</li>
  
<li>This app creates a <i>custom itinerary</i> with three trails and three restaurants based on geodata.</li>

<li>This application utilizes a <b>relational database</b> to store user and itinerary data.</li>

<li><a href='https://developers.google.com/identity/protocols/oauth2'> Google OAuth 2.0</a> is used to authenticate and authorize users.</li>
</ul>

<br>

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents">Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#pitch"> ➤ Pitch</a></li>
    <li><a href="#techical-requirements"> ➤ Technical Requirements</a></li>
    <li><a href="#project-files-description"> ➤ Project Files Description</a></li>
    <li><a href="#routes"> ➤ Routes</a></li>
    <li><a href="#endpoints"> ➤ Endpoints</a></li>
    <li><a href="#getting-started"> ➤ Getting Started</a></li>
    <li><a href="#testing"> ➤ Testing</a></li>
  </ol>
</details>

<br>

<!-- Pitch -->
<h2 id="pitch">Pitch</h2>
Skedaddle is a travel/exploration app that creates a custom travel itinerary for a budgeted, eco-friendly weekend (or 3-day weekend) for a given city, address or location. Results can return parks/hiking/restaurant/museum recommendations, as well as cultural information such as books/music/history. Itineraries could include maps/graphs. Other potential directions include adventure tourism, historical tourism, etc.

<br>

## End User
Targeted towards budget/ecotourism travelers, etc. people who want to travel but need help deciding where to go, or just someone interested in learning more about a given place.

## Problem
This app will be a one stop shop of travel information and create a short recommended itinerary. Could be budget/ecotourism/outdoors/cultural/etc themed. Restaurants recommended by budget, parks/museums/trails/etc could be recommended based on search criteria as well.

## MVP
A user will be able to register with a username, email and password and login with a username and password (with sad paths) from the homepage. They will have a dashboard with a nav bar (“my itineraries”, “skedaddle/search”, and “logout”). On the user dashboard a user can see their saved itineraries with links to their show pages and to delete them. On the search page a user can search by location and receive a generated weekend itinerary with 3 nearby restaurants and 3 nearby parks/trails, which is added to that user’s itineraries.

## Stretch
A user can edit an itinerary (selecting what they like, removing unwanted recommendations, adding new restaurants or parks/hikes) and invite other users/friends to view and edit it. They can search for restaurants by budget, distance, and/or rating, or hikes and parks by activities or difficulty. The app could include top books/poetry/movies/music/historical information for a city/country, and COL/pricing info. More pictures and links. Users can randomize a search.

## Big Stretch
Users can share and vote on which itinerary to use. Maps are incorporated. Itineraries have other sections, such as events, museums, and breweries. A user can change the length of their trip (and so the length of their itinerary). Hotel/flight APIs could be incorporated, or links to AirBnB/booking/SkyScanner websites. OpenAI/ChatGPT itinerary generation could be incorporated.

<br>

<!-- TECHNICAL REQUIREMENTS -->
<h2 id="techical-requirements">Technical Requirements</h2>
<ul>
  <li>Ruby 2.7.4</li>
  <li>Rails 5.2.8</li>
  <li>RSpec</li>
  <li>Bootstrap</li>
  <li>Faraday</li>
  <li>Figaro</li>
  <li>Webmock</li>
  <li>VCR</li>
  <li>SimpleCov</li>
  <li>Orderly</li>
  <li>Capybara</li>
  <li>Launchy</li>
  <li>Factory Bot</li>
  <li>Faker</li>
  <li>Postman</li>
  <li>Shoulda-Matchers</li>
</ul>

<br>
   
<!-- PROJECT FILES DESCRIPTION -->
<h2 id="project-files-description">Project Files Description</h2>
<ul>
  <li><b>app/controllers/application_controller</li></b>
  <ul><li>Application controller which includes helper method to account for current user</li>
    <li>Directs rendering of several elements based on whether a user has logged in</li></ul><br>
  <li><b>app/controllers/welcome_controller.rb</li></b>
  <ul><li>Welcome page controller that initiates login via <b>Google OAuth v2</b></li></ul><br>
  <li><b>app/controllers/sessions_controller.rb</li></b>
  <ul><li>Sessions controller that checks for <i>OmniAuth authentication</i> and creates a new session for user if authentication is successful </li></ul><br>
  <li><b>app/controllers/dashboard_controller.rb</li></b>
  <ul><li>Dashboard controller that creates <i>user dashboard view</i> which provides destination search functionality</li></ul><br>
  <li><b>app/controllers/itineraries_controller.rb</li></b>
  <ul><li>Uses <i>before_action</i> to call backend API in order to receive data on trails and restaraunts based on the destination the user has searched for</li></ul><br>
  <li><b>app/models/user.rb</b></li>
  <ul><li>User model that finds or creates a user after successful OAuth authentication for</li></ul><br>
  <li><b>app/models/itinerary.rb</li></b>
  <ul><li>Itinerary model which references park and restaraunt objects created from API calls for</li></ul><br>
  <li><b>app/views/</li></b>
  <ul><li>Dynamic pages built in HTML and CSS using Bootstrap</li></ul><br>
  <li><b>spec</b><ul>
  <li>Contains test suite files</li>
  <li><i>spec/fixtures/vcr_cassettes</i><ul>
  <li>Subfolder that contains mocked data used in tests to prevent API endpoint calls every time testing suite is run</li></ul>
</ul></ul>

<br>

<!-- ROUTES -->
<h2 id="routes">Routes</h2>

| Rails Routes  |  |  |
| ------------- | ------------- | ------------- |
| get  | /  | welcome#index  |
| get  | /auth/:provider/callback  | sessions#omniauth  |
| delete  | /sessions  | sessions#destroy  |
| get  | /dashboard  | dashboard#show  |
| get  | /about  | dashboard#about_us  |
| get  | /contact  | dashboard#contact  |
| get  | /itineraries  | itineraries#index  |
| post  | /itineraries  | itineraries#create  |
| get  | /itineraries/new  | itineraries#new  |
| get  | /itineraries/:id  | itineraries#show  |
| delete  | /itineraries/:id  | itineraries#destroy  |

<br>

  <!-- Endpoints -->
<h2 id="endpoints">Endpoints</h2>

## [TRAILAPI](https://rapidapi.com/trailapi/api/trailapi/)
* Example query: `https://trailapi-trailapi.p.rapidapi.com/activity/?q-country_cont=&q-city_cont=Denver`
* Authorization: X-RapidAPI-Key HEADER
* Params: q-activities_activity_type_name_eq (search activities), lat, lon, limit, country_cont (search country), state_cont (search state), radius (from lat/lon), q-city_cont (city search)

## [YELP BUSINESS](https://www.yelp.com/developers/documentation/v3/business_search)
* Example query: `https://api.yelp.com/v3/businesses/search?term=restaurants&location=Denver&sort_by=distance`
* Authorization: bearer token
* Params: term, location, latitude, longitude, radius, categories, limit, sort_by (rating/distance), price (1 = $, 2 = $$, etc)

## [POSITIONSTACK](https://positionstack.com/documentation)
* Example query: `http://api.positionstack.com/v1/forward?query=Denver`
* Authorization: access_key
* Params: query

<br>

<!-- GETTING STARTED -->
<h2 id="getting-started">Getting Started</h2>

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/skedaddle</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/skedaddle</code></pre>

<p><b>3. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:easachs/skedaddle.git</code></pre>

<p><b>4. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>

<p><b>5. </b> Install dependencies found in Gemfile</a>.</p>
<pre><code>$ bundle install</code></pre>

<p><b>6. </b> Run migrations</p>
<pre><code>$ rails db:{create,migrate,seed}</code></pre>

<p><b>7. </b> Initiate the application on your local server</a>.</p>
<pre><code>$ rails s</code></pre>

<p><b>8. </b> Open your favorite web browser and enter the URL in the address bar:</p>
<pre><code>localhost:3000</code></pre>

<br>

<!-- TEST SUITE -->
<h2 id="testing">Testing</h2>
To run the test suite, make sure you are in the root of the project and run:
<pre><code>bundle exec rspec</code></pre>