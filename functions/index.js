const functions = require("firebase-functions");

 // https://firebase.google.com/docs/functions/write-firebase-functions
 // to upload file to firebase: firebase deploy --only functions
 // terminal output - all functions urls for example - (limited to ~2M requests)
 //https://us-central1-strike-d-type.cloudfunctions.net/helloWorld


 exports.helloWorld = functions.https.onRequest((request, response) => {
   functions.logger.info("Hello logs!", {structuredData: true});
   response.send("Hello from Firebase!");
 });
