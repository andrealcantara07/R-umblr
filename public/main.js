let close_button = document.getElementById('close0');
let warning = document.getElementById('flash0');

function exit(){
    if (warning.style.display == "block"){
    warning.style.display = "none";
    }
    else {
        warning.style.display ="block"
    }
}

close_button.addEventListener('click', exit);