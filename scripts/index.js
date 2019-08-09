//setup 
const ramiahList = document.querySelector('.guides')
const loggedOutLinks = document.querySelectorAll('.logged-out');
const loggedInLinks = document.querySelectorAll('.logged-in');
const accountDetails = document.querySelector('.account-details');
const adminItems = document.querySelectorAll('.admin');


const setupUI = (user)=>{
    if(user){
        //toggle UI elements
        if(user.admin){
            adminItems.forEach(item=>{
                item.style.display = 'block';
            })
        }
        const html = `
        <div>Logged in as ${user.email}</div>
        <div class="pink-text">${user.admin ? 'Admin':''}</div>
      `;
      accountDetails.innerHTML = html;

        loggedInLinks.forEach(item => item.style.display = 'block');
    loggedOutLinks.forEach(item => item.style.display = 'none');
    }else{
        adminItems.forEach(item=>{
            item.style.display = 'none';
        })
        accountDetails.innerHTML = '';
        loggedInLinks.forEach(item => item.style.display = 'none');
    loggedOutLinks.forEach(item => item.style.display = 'block');
    }
}


/*const setupGuides = (data)=>{
    if(data.length){
        let html = '';
        data.forEach(doc => {
            const guide = doc.data();
            //console.log(guide);
            const li =`<li>
            <div class="collapsible-header grey lighten-4"> ${guide.name} </div>
            <div class="collapsible-body white"> Age :${guide.age} </div>
            <div class="collapsible-body white">Address: ${guide.address} </div>
            <div class="collapsible-body white">Phone: ${guide.phone} </div>
        </li>`;
        html += li;
        });
        ramiahList.innerHTML = html;
    }else{
        ramiahList.innerHTML= '<h5 class="center-align">Only Admin Can Login</h5>';
    }
}*/

// setup materialize components
document.addEventListener('DOMContentLoaded', function() {

    var modals = document.querySelectorAll('.modal');
    M.Modal.init(modals);
  
    var items = document.querySelectorAll('.collapsible');
    M.Collapsible.init(items);
  
  });
