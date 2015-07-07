BeepBoop Website v1.0
--------------------

Built using Yeoman and the Angular-FullStack generator. Utilizes the following 'options' from the generator...

- MongoDB w/ Mongoose ORM
- OAuth
- Socket.IO
- Angular w/ uiRouter instad of ngRoute

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


## Configuration Details
In order to have the site operate expectedly environment variables are used. These are defined in `server > config > environment`. You can set local environment variables for testing by creating a 'local.env.js' file within the `server > config` directory; a sample is available for reference!

On every environment the following ENV_VARS must be set...
- S3_FOLDER
- S3_BUCKET
- S3_KEY
- S3_SECRET
- NODE_ENV (must be 'production' outside of local testing)


## Website Assets
All website assets are stored within Amazon S3. We use **camelCasing** for all assets currently.
