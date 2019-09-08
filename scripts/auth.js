
//add admin cloud functions
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
    if(user){
        user.getIdTokenResult().then(idTokenResult=>{
            user.admin=idTokenResult.claims.admin;
            setupUI(user);
        })
    }else{
        setupUI();
    }
})

let hosplist = []
//signup
const signupForm = document.querySelector('#signup-form');
signupForm.addEventListener('submit',(e)=>{
    e.preventDefault();
    const uemail = signupForm['signup-email'].value;
    const tuname = signupForm['signup-name'].value;
    const uname = tuname.split(' ').join('_').toLowerCase();
    const upassword = signupForm['signup-password'].value;
    const phno = signupForm['signup-phone'].value;
    const phoneNum = phno;
    
    const addUsers = functions.httpsCallable('addUsers');
    addUsers({email:uemail,password:upassword,displayName:uname}).then(result=>{
        //console.log(result.data);
        let hospname = result.data.displayName;
        
        //console.log(result.data.phoneNumber);
        if(hospname){
            db.collection('users').doc(result.data.uid).set({
                'phone_number': phoneNum
              });
            db.collection(`${hospname}`).add({
                'PID':'XX',
                'Date':'XX',
                'Time':'0',
                'Dob':'XX/XX/XX',
                'Age':00,
                'Sex':'TEST',
                'Address':'XX',
                'Phone No.':'XXXXXXXXXX',
                'Height':'XX',                  
                'Weight':'XX',
                'Bmi':'XX',
                'Heart Rate':'XX',
                'Systolic Blood Pressure':'XX',
                'Diastolic Blood Pressure':'XX',
                'Oxygen Saturation': 'XX',
                'Cholestrol Level': 'XX',
                'Waist Hip Ratio':'XX',
                'Diabetes Mellitius': 'XX',
                'Diabetes Mellitius Drugs': 'XX',
                'Hypertension':'XX',
                'Hypertension Drugs':'XX',
                'Smoker':'XX',
                'Alcohol':'XX',
                'Other Conditions ':'XX',
                'Risk':'0'
              })

              
              hosplist.push(hospname);
              //console.log(hosplist);
        }
        const modal = document.querySelector('#modal-signup');
            M.Modal.getInstance(modal).close();
            signupForm.reset();
    }).catch(err=>{
        console.log(err.message);
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
            cred.user.getIdTokenResult().then(token=>{
                let admino = token.claims.admin
                console.log(admino);
                if(!admino){
                    alert('Only admins can login')
                    auth.signOut();
                }
            })
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
    const h1name = document.querySelector('#hospital-name').value;
    //const hname = h1name.replaceA(' ','_').toLowerCase();
    const hname = h1name.split(' ').join('_').toLowerCase();
    //console.log(hname);
    const collectionName = db.collection(`${hname}`);
    db.collection(`${hname}`).orderBy('Time').get()
    .then(snapshot => {
      snapshot.forEach(doc => {
        const dats = doc.data();
        jsond.push(dats);
      })
      var array = jsond;
      if(array.length==0){
          alert('No such hospital exists');
          dataForm.reset();
      }else{
        var str = '';
        var str1 = '';
        var currentDate = new Date();
        var date = currentDate.getDate();
        var month = currentDate.getMonth()+1;
        var year = currentDate.getFullYear();
        
        let indexing = ['PID','Date','Time','Dob','Age','Phone No.','Sex','Address','Height','Weight','Bmi','Heart Rate','Systolic Blood Pressure','Diastolic Blood Pressure','Oxygen Saturation','Cholestrol Level','Waist Hip Ratio','Diabetes Mellitius','Diabetes Mellitius Drugs','Hypertension','Hypertension Drugs','Smoker','Alcoholic','Other Conditions ','Risk']
        for (var i = 0; i < array.length; i++) {
            var line = '';
            var details = ''
            for (var index in indexing) {
                if (line != '') line += ','
                    details+= indexing[index]+',';
                //console.log(details);
                line += array[i][indexing[index]];
                //console.log(line);
            }

            str1 += line + '\r\n';
        }
        str = details+'\r\n'+str1
            var exportedFilenmae =  hname+'-('+date+'-'+month+'-'+year+')'+'.csv'
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
