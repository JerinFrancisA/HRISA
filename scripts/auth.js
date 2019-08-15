// get data
//add admin cloud functions
//const json2csv = require("json2csv").parse;

const adminForm = document.querySelector('.admin-actions');
adminForm.addEventListener('submit',(e)=>{
    e.preventDefault();
    const adminEmail = document.querySelector('#admin-email').value;
    const addAdminRole = functions.httpsCallable('addAdminRole');
    addAdminRole({email:adminEmail}).then(result=>{
        console.log(result);
        adminForm.reset();
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
    }else{
        console.log(user);
        setupUI();
    }
})





//signup

const signupForm = document.querySelector('#signup-form');
signupForm.addEventListener('submit',(e)=>{
    e.preventDefault();
    const uemail = signupForm['signup-email'].value;
    const uname = signupForm['signup-name'].value;
    const upassword = signupForm['signup-password'].value;
    
    const addUsers = functions.httpsCallable('addUsers');
    addUsers({email:uemail,password:upassword,displayName:uname}).then(result=>{
        console.log(result.data);
        let hospname = result.data.displayName;
        if(hospname){
            db.collection(`${hospname}`).add({
                'Name':'TEST',
                'Dob':'XX/XX/XX',
                'Age':00,
                'Sex':'TEST',
                'Address':'XX',
                'Phone No.':'XXXXXXXXXX',
                'Height':'XX',
                'Weight':'XX',
                'Bmi':'XX',
                'Heart Rate':'XX',
                'Blood Pressure':'XX',
                'Oxygen Saturation': 'XX',
                'Cholestrol Level': 'XX',
                'Waist Hip Ratio':'XX',
                'Diabetes Mellitius': 'XX',
                'Diabetes Mellitius Drugs': 'XX',
                'Hypertension':'XX',
                'Hypertension Drugs':'XX',
                'Smoker':'XX',
                'Other Conditions ':'XX',
                'Risk':'0',
                'Recommendation':00
              })
        }
        const modal = document.querySelector('#modal-signup');
            M.Modal.getInstance(modal).close();
            signupForm.reset();
    }).catch(err=>{
        console.log(err.message);
    })
    /*.then(()=>{
        db.collection(`${uname}`).doc('TEST').set({
            name:uname
        })
        
        const modal = document.querySelector('#modal-signup');
            M.Modal.getInstance(modal).close();
            signupForm.reset();
    }).catch(err=>{
        console.log(err);
    })*/

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
let jsond=[];
dataForm.addEventListener('submit',(e)=>{
    e.preventDefault();
    const hname = document.querySelector('#hospital-name').value;
    const collectionName = db.collection(`${hname}`);
    //console.log(collectionName);
    db.collection(`${hname}`).get()
    .then(snapshot => {
      snapshot.forEach(doc => {
        //console.log(doc.id, '=>', doc.data());
        const dats = doc.data();
        jsond.push(dats);
      })
      var array = jsond;
      //console.log(array);
      if(array.length==0){
          alert('No such hospital exists');
          dataForm.reset();
      }else{
        var str = '';
        var str1 = '';
        var currentDate = new Date();
        var date = currentDate.getDate();
        var month = currentDate.getMonth();
        var year = currentDate.getFullYear();
        
        for (var i = 0; i < array.length; i++) {
            var line = '';
            var details = ''
            for (var index in array[i]) {
                if (line != '') line += ','
                    details+= index+',';
                line += array[i][index];
            }

            str1 += line + '\r\n';
        }
        str = details+'\r\n'+str1
        //console.log('Data in csv is ',str);
        //const ud = 'undefined'
        //console.log(str);
        
            var exportedFilenmae =  hname+'-'+date+'/'+month+'/'+year+'.csv'
            var blob = new Blob([str], { type: 'text/csv;charset=utf-8;' });
            if (navigator.msSaveBlob) { // IE 10+
                navigator.msSaveBlob(blob, exportedFilenmae);
                jsond=[];
            } else {
                var link = document.createElement("a");
                if (link.download !== undefined) { // feature detection
                    // Browsers that support HTML5 download attribute
                    var url = URL.createObjectURL(blob);
                    link.setAttribute("href", url);
                    link.setAttribute("download", exportedFilenmae);
                    link.style.visibility = 'hidden';
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                    jsond=[];
                }
            }
        dataForm.reset();
      }
    })
    .catch(err => {
      console.log('Error getting documents', err);
    })
});

//// ISSUES TO BE RESOLVED
// 2.NOT HANDLING COMMA SEPRATED FIELDS
