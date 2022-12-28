# Skedaddle

![image](https://user-images.githubusercontent.com/95776577/191402464-90f06a92-613b-4338-be41-0261f39f62e9.png)


<ul>
<li><b>Skedaddle</b> is a <b>Rails</b> application that has both frontend and backend repositories.</li>

<li>The frontend consumes API endpoints exposed by the backend, which is consuming data from <b>AllTrails API</b> and <b>Yelp Fusion API</b>.</li>
  
  <li>This app creates a <i>custom itinerary</i> with <b>three trails</b> and <b>three restaurants</b> based on geodata.</li>

<li>This application utilizes a <b>relational database</b> to store user and itinerary data.</li>

<li><a href='https://developers.google.com/identity/protocols/oauth2'> Google OAuth 2.0</a> is used to authenticate and authorize users</li>

<li>The application was deployed using <b>CI/CircleCI</b> on <b><a href='https://skedaddle-turing-fe.herokuapp.com'> Heroku</a></b> but can also be viewed on a local server.</li></ul>

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#techical-requirements"> ➤ Technical Requirements</a></li>
    <li><a href="#project-files-description"> ➤ Project Files Description</a></li>
    <li><a href="#routes"> ➤ Routes</a></li>
    <li><a href="#db-schema"> ➤ Database Schema</a></li>
    <li><a href="#getting-started"> ➤ Getting Started</a></li>
    <li><a href="#test-suite"> ➤ Test Suite</a></li>
    <li><a href="#scenario1"> ➤ Scenario 1: Login </a></li>
    <li><a href="#scenario2"> ➤ Scenario 2: Search for a Destination </a></li>
    <li><a href="#scenario3"> ➤ Scenario 3: View Additional Trail Details  </a></li>
    <li><a href="#scenario4"> ➤ Scenario 4: View Additional Restaurant Details</a></li>
    <li><a href="#scenario5"> ➤ Scenario 5: Save Itinerary or Search Again </a></li>
    <li><a href="#scenario6"> ➤ Scenario 6: Saved Itinerary </a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

<!-- TECHNICAL REQUIREMENTS -->
<h2 id="techical-requirements"> 💻 Technical Requirements</h2>
<ul>
  <li>Ruby 2.7.4</li>
  <li>Rails 5.2.6</li>
  <li>RSpec-Rails 4.0.1</li>
   <li>Bootstrap 4</li>
  <li>Faraday</li>
  <li>Figaro</li>
  <li>Webmock</li>
  <li>VCR</li>
  <li>Capybara</li>
  <li>SimpleCov</li>
  <li>Launchy</li>
  <li>Factory Bot</li>
  <li>Faker</li>
  <li>JSON API Serializer</li>
  <li>Postman</li>
  <li>Shoulda-Matchers</li>
  </ul>
  <p><i>Installation instructions found in</i> <a href="#getting-started"> ➤ Getting Started</a></p>
   
<!-- PROJECT FILES DESCRIPTION -->
<h2 id="project-files-description"> :floppy_disk: Project Files Description</h2>
<ul>
  <li><b>app/controllers/application_controller</li></b>
  <ol>
  <li>Application controller which includes helper method to account for current user</li>
    <li>Directs rendering of several elements based on whether a user has logged in</li></ol><br>
  <li><b>app/controllers/welcome_controller.rb</li></b>
  <ol>
  <li>Welcome page controller that initiates login via <b>Google OAuth v2</b></li></ol><br>
  <li><b>app/controllers/sessions_controller.rb</li></b>
  <ol>
  <li>Sessions controller that checks for <i>OmniAuth authentication</i> and creates a new session for user if authentication is successful </li></ol><br>
  
  <li><b>app/controllers/dashboard_controller.rb</li></b>
  <ol>
  <li>Dashboard controller that creates <i>user dashboard view</i> which provides destination search functionality</li></ol><br>
  
  <li><b>app/controllers/itineraries_controller.rb</li></b>
  <ol>
  <li>Uses <i>before_action</i> to call backend API in order to receive data on trails and restaraunts based on the destination the user has searched for</li></ol><br>
  
 
 <li><b>app/models/user.rb</b></li>
 <ol>
  <li>User model that finds or creates a user after successful OAuth authentication for</li></ol><br>
  
 <li><b>app/models/itinerary.rb</li></b>
  <ol>
  <li>Itinerary model which references park and restaraunt objects created from API calls for</li></ol><br>
  
 <li><b>app/views/..</li></b>
  <ol>
  <li>Dynamic pages built in HTML and CSS using Bootstrap</li></ol></ul>

<h3>Some other supporting files</h3>
<ul><li><b>spec</b><ol>
  <li>Contains test suite files</li>
  <li><i>spec/fixtures/vcr_cassettes</i><ol>
  <li>Subfolder that contains mocked data used in tests to prevent API endpoint calls every time testing suite is run</li></ol>
</ul>

   
<!-- ROUTES -->
<h2 id="routes"> :open_file_folder: Routes</h2>

| Rails Routes  |  |  |
| ------------- | ------------- | ------------- |
| root  | welcome#index  | goes to welcome index page  |
| get  | '/auth/:provider/callback'  | 'sessions#omniauth'  |
| get  | '/dashboard'  | 'dashboard#show'  |
| delete  | '/sessions'  | 'sessions#destroy'  |
| get  | '/about'  | 'about_us_contact#about_us'  |
| get  | '/contact'  | 'about_us_contact#contact'  |
| resources  | '/itineraries'  | except: %i[edit update]  |


<!-- DATABASE SCHEMA -->
<h2 id="db-schema"> :desktop_computer: Database Schema</h2>

![image](https://user-images.githubusercontent.com/95776577/191345428-e697d55a-a33b-4b8e-b469-b31e422727dd.png)


<!-- GETTING STARTED -->
<h2 id="getting-started"> :book: Getting Started</h2>

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/skedaddle-fe</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/skedaddle-fe</code></pre>
<p><b>3. </b> Copy the repository by clicking on the code button on Github repo page (using SSH).</p>

![183747041-40f47875-442e-4008-8d00-8c45bf2731fe](https://user-images.githubusercontent.com/95776577/183752233-c9130b38-ce16-4b4c-aeb4-fdf0d0d4a137.png)

<p><b>4. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:JohnSantosuosso/skedaddle-fe.git</code></pre>

<p><b>5. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>

<p><b>6. </b> Install dependencies found in Gemfile</a>.</p>
<pre><code>$ bundle install</code></pre>

<p><b>10. </b> Run migrations</p>
<pre><code>$ rails db:{create,migrate,seed}</code></pre>

<p><b>11. </b> Initiate the application on your local server</a>.</p>
<pre><code>$ rails s</code></pre>

<p><b>12. </b> Open your favorite web browser and enter the URL in the address bar:</p>
<pre><code>localhost:3000</code></pre>

<!-- TEST SUITE -->
<h2 id="test-suite"> :heavy_check_mark: Test Suite</h2>
To run the test suite, make sure you are in the root of the project and run: <pre><code>bundle exec rspec</code></pre>

<!-- SCENARIO1 -->
<h2 id="scenario1"> :small_orange_diamond: Scenario 1: Login</h2>
<p><b>a.</b> The user logs in using Google OAuth Services</p>

![ezgif com-gif-maker](https://user-images.githubusercontent.com/95776577/191350939-5b522e88-631f-45be-8171-439e9f827c01.gif)

<br>

<!-- SCENARIO2 -->
<h2 id="scenario2"> :small_orange_diamond: Scenario 2: Search for a Destination </h2>
<p><b>a.</b> A user can search for a destination:</p>

![ezgif com-gif-maker-3](https://user-images.githubusercontent.com/95776577/191394746-fd4a3a8c-0626-40d5-881e-cfd87b6eb8c2.gif)

<p><b>b.</b> The user receives an itinerary with three nearby hiking trails and restaraunts:</p>

![ezgif com-gif-maker-4](https://user-images.githubusercontent.com/95776577/191394893-2faf2e48-12bc-41b3-a29b-0ffa41aa4164.gif)

<br>

<!-- SCENARIO3 -->
<h2 id="scenario3"> :small_orange_diamond: Scenario 3: View Additional Trail Details </h2>
<p><b>a.</b> A user can visit the trail's website to view more information:</p>

![ezgif com-gif-maker-5](https://user-images.githubusercontent.com/95776577/191396202-a6160152-eb11-4895-a439-cb98aecbef52.gif)

<br>

<!-- SCENARIO4 -->
<h2 id="scenario4"> :small_orange_diamond: Scenario 4: View Additional Restaurant Details </h2>
<p><b>a.</b> A user can visit the restaurant's website to view more information:</p>

![ezgif com-gif-maker-6](https://user-images.githubusercontent.com/95776577/191397685-a8362035-2a00-4abd-a79c-3486c6520f2b.gif)

<br>

<!-- SCENARIO5 -->
<h2 id="scenario5"> :small_orange_diamond: Scenario 5: Save Itinerary or Search Again </h2>
<p>A user has the option to save an itinerary or search again:</p>
<img width="1134" alt="Screen Shot 2022-09-20 at 10 18 33 PM" src="https://user-images.githubusercontent.com/95776577/191400006-9e051dfa-35d2-4198-a21e-3e75243f62ce.png">
<br>
<!-- SCENARIO6 -->
<h2 id="scenario6"> :small_orange_diamond: Scenario 6: Saved Itinerary </h2>
<p><b>a.</b> User receives confirmation an itinerary has been saved:</p>

![image](https://user-images.githubusercontent.com/95776577/191400684-4fd3f722-1ba0-472e-b6f5-ad8e2a0115e2.png)
<br>
<br>
<p><b>b.</b> User can delete a saved itinerary:</p>

![image](https://user-images.githubusercontent.com/95776577/191401205-23e15deb-c487-4e79-b26a-c9a80591b368.png)

<br>
<br>
<p><b>c.</b> User can view saved itineraries:</p>

![image](https://user-images.githubusercontent.com/95776577/191400840-5ba87c24-2593-47ea-b51c-10899642786c.png)

<br>
<br>
<p><b>d.</b> Saved itineraries include a link to each itinerary: </p>

![image](https://user-images.githubusercontent.com/95776577/191402030-3fa276eb-f5dc-494a-8cf0-51018757b9a3.png)


<!-- CREDITS -->
<h2 id="credits"> :scroll: Credits</h2>
<h3>Nick Jones</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/nlj77)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nickolas-jones-523b66b7)

<h3>Drew MacNicholas</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dmacnicholas)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/drew-macnicholas-20b75660/)

<h3>Wes Miranda</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/wes30303?tab=repositories)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/wesley-miranda-80a725196/)


<h3>Eli Sachs</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/easachs)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/easachs)


<h3>John Santosuosso</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/johnsantosuosso)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/john-santosuosso)


<p>Project built as part of Turing School of Software and Design's <a href="https://backend.turing.edu/module3/projects/consultancy/"> Consultancy Competition.</a></p>


- - - - -


# SKEDADDLE

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#techical-requirements"> ➤ Technical Requirements</a></li>
    <li><a href="#project-files-description"> ➤ Project Files Description</a></li>
    <li><a href="#getting-started"> ➤ Getting Started</a></li>
    <li><a href="#Endpoints"> ➤ Endpoints</a></li>
    <li><a href="#Pitch"> ➤ Pitch</a></li>
    <li><a href="#MVP"> ➤ MVP</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
 </details>
 <!-- PROJECT FILES DESCRIPTION -->
<h2 id="project-files-description"> :floppy_disk: Project Files Description</h2>

<ul>
  <li><b>app/controllers</li></b>
  <ol>
  <li>Contains several controllers that initiates API call processes through <i>movie_facade.rb</i></li></ol>
  <li><b>app/controllers/parks_facade.rb, restaurants_facade.rb</b></li><ol>
  <li>Processes data returned through <i>app/services</i></li></ol>
   <li><b>app/services</b>
    <ol>
  <li>Makes API calls via <i>Faraday</i></li></ol>
  <li><b>app/poros</b></li><ol>
  <li>Formats API data into Ruby objects</li></ol>
</ul>
<!-- TECHNICAL REQUIREMENTS -->
<h2 id="techical-requirements"> 💻 Technical Requirements</h2>
<ul>
  <li>Ruby 2.7.4</li>
  <li>Rails 5.2.6</li>
  <li>RSpec-Rails 5.1.2</li>
  <li>Faraday</li>
  <li>Figaro</li>
  <li>Webmock</li>
  <li>VCR</li>
  <li>Capybara</li>
  <li>SimpleCov</li>
  <li>Launchy</li>
  <li>Orderly</li>
  <li>Shoulda-Matchers</li>
  </ul>
  
  <!-- Endpoints -->
<h2 id="Endpoints"> :book: Endpoints</h2>

### [TRAILAPI city/activity search](https://rapidapi.com/trailapi/api/trailapi/)
* `https://trailapi-trailapi.p.rapidapi.com/activity/?q-country_cont=&q-city_cont=Denver`
* Authorization: X-RapidAPI-Key HEADER
* Params: q-activities_activity_type_name_eq (search activities), lat, lon, limit, country_cont (search country), state_cont (search state), radius (from lat/lon), q-city_cont (city search)
![image](https://user-images.githubusercontent.com/54329737/191977271-60772c64-92cb-4ff2-bcfc-eb05d41376b7.png)


### [YELP BUSINESS](https://www.yelp.com/developers/documentation/v3/business_search)
* `https://api.yelp.com/v3/businesses/search?term=restaurants&location=Denver&sort_by=distance`
* Authorization: bearer token
* Params: term (restaurants, parks, etc), location (city/address/etc), latitude, longitude, radius, categories, limit, sort_by (rating/distance/etc), price (1 = $, 2 = $$, etc)
![image](https://user-images.githubusercontent.com/54329737/191977359-d3b642f4-a053-4b4d-b299-60c7cd0bc42b.png)

  
  <!-- GETTING STARTED -->
<h2 id="getting-started"> :book: Getting Started</h2>

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/skedaddle-be</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/skedaddle-be</code></pre>
<p><b>3. </b> Copy the repository by clicking on the code button on Github repo page (using SSH).</p>

![image](https://user-images.githubusercontent.com/54329737/191562284-04ada6f8-8cfc-435b-80df-2f0c6b09f5aa.png)

<p><b>4. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:JohnSantosuosso/skedaddle-be.git</code></pre>

<p><b>5. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>

<p><b>6. </b> Install dependencies found in Gemfile</a>.</p>
<pre><code>$ bundle install</code></pre>

<p><b>7. </b> Inside your project directory, install <a href="https://github.com/laserlemon/figaro"> Figaro</a> via your terminal.</p>
<pre><code>$ bundle exec figaro install</code></pre>

<p><b>8. </b> Install <a href="https://lostisland.github.io/faraday/"> Faraday</a>.</p>
<pre><code>$ bundle exec faraday install</code></pre>

<p><b>9. </b> Add API key to config/applicalion.yml</a>.</p>
<pre><code>$ trail_api_key: XXXXX, yelp_api_key: XXXXX</code></pre>

<p><b>10. </b> Run migrations</p>
<pre><code>$ rails db:{create,migrate,seed}</code></pre>

<!-- Pitch -->
<h2 id="Pitch"> :scroll: Pitch</h2>
A travel slash exploration app that creates a custom travel itinerary for a budgeted, eco-friendly weekend (or 3-day weekend) in a given city or locale. Either national or international depending on API availability. Results can also return parks/hiking/restaurant/museum recommendations, as well as cultural information (such as books/music/history/etc). Could include maps/graphs. Other potential directions include adventure tourism, historical tourism, etc. <p>Front End Project Repo Link <a href="https://github.com/skedaddle-llc/skedaddle-fe"> Skedaddle FE.</a></p>

### END USER
Targeted towards budget/ecotourism travelers, etc. people who want to travel but need help deciding where to go, or just someone interested in learning more about a given place.

### PROBLEM
This app will be a one stop shop of aggregated information and create a short recommended itinerary. Could be budget/ecotourism/outdoors/cultural/etc themed. Restaurants recommended by budget, parks/museums/trails/etc could be recommended based on search criteria as well.

### FEATURES
Users can save and edit search results, maybe invite friends. Recommended parks, hiking trails, museums, restaurants. Top books/poetry/movies/music/historical information for a city/country. Cost of Living info. Pictures and links to find more information. Ability to alter results based on search criteria. Possible random/Geoguessr style itinerary generator. Could link to Airbnb/booking/skyscanner/etc.

### INTEGRATIONS
APIs - Yelp (restaurants), NPS/Travel Places/TrailAPI (parks/trails/hiking/biking), hotels/booking/skyscanner, Stretch: OpenAI to generate itinerary?

<!-- MVP -->
<h2 id="MVP"> :book: MVP</h2>
A user will be able to register with a username, email and password and login with a username and password (with sad paths) from the homepage. They will have a dashboard with a nav bar (“my itineraries”, “skedaddle/search”, and “logout”). On the user dashboard a user can see their saved itineraries with links to their show pages and to delete them. On the search page a user can search by location and receive a generated weekend itinerary with 3 nearby restaurants and 3 nearby parks/trails, which is added to that user’s itineraries.

### STRETCH
A user can edit an itinerary (selecting what they like, removing unwanted recommendations, adding new restaurants or parks/hikes) and invite other users to it. They can search for restaurants by budget, distance, and/or rating, or hikes and parks by activities or difficulty. Users can also randomize a search.

### BIG STRETCH
Users can share and vote on which itinerary to use. Maps are incorporated. Itineraries have other sections, such as events/museums. A user can change the length of their trip (and so the length of their itinerary). Hotel/flight APIs incorporated. OpenAI itinerary generation incorporated.

<!-- CREDITS -->
<h2 id="credits"> :scroll: Credits</h2>
<h3>Drew MacNicholas</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dmacnicholas)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/drew-macnicholas-20b75660/)
<h3>Wesley Miranda</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/wes30303)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/wesley-miranda-80a725196/)
<h3>Eli Sachs</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/easachs)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/easachs/)
<h3>John Santosuosso</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/JohnSantosuosso)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/john-santosuosso/)
<h3>Nickolas Jones</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/nlj77)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nickolas-jones-523b66b7/)