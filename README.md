BeepBoopWebsite
--------------------

Built using Yeoman and the Angular-FullStack generator. Utilizes the following 'options' from the generator...

- MongoDB w/ Mongoose ORM
- OAuth
- Socket.IO
- Angular w/ uiRouter instead of ngRoute

#### PreProcessor Languages
- Jade
- Stylus
- Coffeescript

## How to run the project

### I. Install the DB
1. Install Brew ([homepage](http://brew.sh/))
2. Install mongod using this command ```brew install mongodb```
3. Set permissions to the data directory (if needed) ```sudo chmod 0755 /data/db```
4. Run mongod ```mongod```

### Install Node Packages
1. In a terminal window, navigate to the app's folder.
2. Optional: Run ```rm -rf node_modules && npm cache clean```
1. Run ```npm install```
2. Done!

### II. Run the app
1. In a new terminal window, navigate to the app's folder and run ```bower install```
2. Then run ```grunt``` to confirm everything builds correctly. For Unit Test failures; you can add an optional ```-f``` to force.
3. Then run ```grunt serve``` to see everything run!
4. That's it :)
