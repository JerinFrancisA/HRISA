//setup 
const ramiahList = document.querySelector('.guides')
const loggedOutLinks = document.querySelectorAll('.logged-out');
const loggedInLinks = document.querySelectorAll('.logged-in');
const accountDetails = document.querySelector('.account-details');
const adminItems = document.querySelectorAll('.admin');
const img = document.querySelector('.brand-logo');

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
        <div class="pink-text">${user.admin ? 'Admin':''}</div>`;
        accountDetails.innerHTML = html;
        //alert('Only admins have access to the website');
        img.style.display='block';
        loggedInLinks.forEach(item => item.style.display = 'block');
        loggedOutLinks.forEach(item => item.style.display = 'none');
    }else{
        adminItems.forEach(item=>{
            item.style.display = 'none';
        })
        accountDetails.innerHTML = '';
        img.style.display='none';
        loggedInLinks.forEach(item => item.style.display = 'none');
        loggedOutLinks.forEach(item => item.style.display = 'block');
    }
}

// setup materialize components
document.addEventListener('DOMContentLoaded', function() {

    var modals = document.querySelectorAll('.modal');
    M.Modal.init(modals);
  
    var items = document.querySelectorAll('.collapsible');
    M.Collapsible.init(items);
  
  });
