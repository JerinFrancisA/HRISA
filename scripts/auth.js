// get data
//add admin cloud functions
const adminForm = document.querySelector('.admin-actions');
adminForm.addEventListener('submit',(e)=>{
    e.preventDefault();
    const adminEmail = document.querySelector('#admin-email').value;
    const addAdminRole = functions.httpsCallable('addAdminRole');
    addAdminRole({email:adminEmail}).then(result=>{
        console.log(result);
    })
})


// auth status changes
const sipForm = document.querySelector('#signup-form');
const sname = sipForm['signup-name'].value;
auth.onAuthStateChanged(user=>{
    //console.log(user);
    if(user){
        //console.log('user logged in',user);
        user.getIdTokenResult().then(idTokenResult=>{
            user.admin=idTokenResult.claims.admin;
            setupUI(user);
        })
      /* db.collection('ramaiah').onSnapshot(snapshot =>{
            //console.log(snapshot.docs);
            setupGuides(snapshot.docs);
            
        },err=>{
            console.log(err.message)
        });*/
    }else{
        console.log(user);
        setupUI();
        //setupGuides([]);
    }
})

//no need this adding new stufff

/*const createForm = document.querySelector('#create-form');
createForm.addEventListener('submit',(e)=>{
    e.preventDefault();

    db.collection('ramaiah').add({
        name: createForm['title'].value,
        address :createForm['content'].value
    }).then(()=>{
        const modal = document.querySelector('#modal-create');
            M.Modal.getInstance(modal).close();
            createForm.reset();
    }).catch(err=>{
        console.log(err.message);
    })
})*/

//signup

const signupForm = document.querySelector('#signup-form');

/*signupForm.addEventListener('submit',(e)=>{
    e.preventDefault();
    
    //get user info
    const email = signupForm['signup-email'].value;
    const name = signupForm['signup-name'].value;
    const password = signupForm['signup-password'].value;

    //sign up
    auth.createUserWithEmailAndPassword(email,password)
        .then((cred)=>{
            console.log(user.updateProfile({displayName:name}))
            //console.log(cred.user)
            //cred.user.displayName = name;
            return db.collection(`${name}`).doc('TEST').set({
                name:name
            })
            
        }).then(()=>{
            const modal = document.querySelector('#modal-signup');
            M.Modal.getInstance(modal).close();

            signupForm.reset();
            signupForm.querySelector('.error').innerHTML=''
        }).catch(err=>{
            signupForm.querySelector('.error').innerHTML=err.message;
        });
});*/

signupForm.addEventListener('submit',(e)=>{
    e.preventDefault();
    const uemail = signupForm['signup-email'].value;
    const uname = signupForm['signup-name'].value;
    const upassword = signupForm['signup-password'].value;

    const addUsers = functions.httpsCallable('addUsers');
    addUsers({email:uemail,password:upassword,displayName:uname}).then(result=>{
        console.log('created new user',result);
    }).then(()=>{
        db.collection(`${uname}`).doc('TEST').set({
            name:uname
        })
        
        const modal = document.querySelector('#modal-signup');
            M.Modal.getInstance(modal).close();
            signupForm.reset();
    }).catch(err=>{
        console.log(err);
    })

})

//logout
const logout = document.querySelector('#logout');
logout.addEventListener('click',(e)=>{
    e.preventDefault();
    auth.signOut();
})

//login

const loginForm = document.querySelector('#login-form');
loginForm.addEventListener('submit',(e)=>{
    e.preventDefault();

    const email = loginForm['login-email'].value;
    const password = loginForm['login-password'].value;

    auth.signInWithEmailAndPassword(email,password)
    .then(cred =>{
        //console.log(cred.user);
        const modal = document.querySelector('#modal-login');
        M.Modal.getInstance(modal).close(); //close the form
        loginForm.reset();
        loginForm.querySelector('.error').innerHTML='';
    }).catch(err=>{
        loginForm.querySelector('.error').innerHTML=err.message;
    }) 
})

// get data from the firestore
const dataForm = document.querySelector('.data-actions');

dataForm.addEventListener('submit',(e)=>{
    e.preventDefault();
    const hname = document.querySelector('#hospital-name').value;
    db.collection(`${hname}`).get()
    .then(snapshot => {
      snapshot.forEach(doc => {
        console.log(doc.id, '=>', doc.data());
        dataForm.reset();
      });
    })
    .catch(err => {
      console.log('Error getting documents', err);
    });
})