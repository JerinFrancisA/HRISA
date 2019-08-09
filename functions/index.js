const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

exports.addAdminRole = functions.https.onCall((data,context)=>{
    //check request is made by an admin
    if(context.auth.token.admin!==true){
        return {error:'Only admins can Add'}
    }
    // get user and add claim
    return admin.auth().getUserByEmail(data.email).then(user=>{
        return admin.auth().setCustomUserClaims(user.uid,{
            admin:true
        });
    }).then(()=>{
        return {
            message:`Success ${data.email} has been made an admin`
        }
    }).catch(err =>{
        return err;
    });
});

exports.addUsers = functions.https.onCall((data,context)=>{
    if(context.auth.token.admin!==true){
        return {error:'Only admins can Add'}
    }

    return admin.auth().createUser(data).then(user=>{
        return{
            message:`Successfully created a new User ${user}`}
    }).catch(err=>{
        console.log(err);
    })
})


