function load() {
    let btnGreet = document.querySelector('.btnGreet');

    if(btnGreet){
        btnGreet.addEventListener('click', function(e){
            alert('hello world!');
        });
    }
}

document.addEventListener("DOMContentLoaded", load, false);