# P&B

P&B is a lightweight and playful copy of Airbnb for customers who would like to rent one or several pigeons in order to make their monuments more “authentic”. The logic behind being that “authentic” monuments like large sculptures, fountains or iconic plazas usually have pigeons flying around. 

rent-my-time.herokuapp.com

# How it Works

The application uses features like:
-	Browsing by location, utilizing an integration to Mapbox
-	A booking request page with a calendar
-	A section for comments
-	The ability for the Pigeon owner to add new Pigeons to his account and attach images to them via an integration with Cloudinary
-	An approval page for the Pigeon owner to review all his booking requests and accept/decline   

# How to Test It

Currently, the only application is only seeded with pigeons located in Montreal. Search for Montreal on the search bar to see the app in action. 

You will need to create an account to access most features

# Set Up

Clone this repository. Create a .env file in the project directory. Add your OpenAI API key to the .env file as follows:

OPENAI_API_KEY=your_api_key_here

Then add your Cloudinary key to the .env file as follows:

CLOUDINARY_URL=your_api_key_here

Run: Bundle Install

# Running the Script

After setting up the project, run: 
- Rails server
- Yarn JavaScript compiler 

Open your browser and run your local host http://localhost:3000/
