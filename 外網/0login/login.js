let submit= document.getElementById("submit")
let passTF=1
let loginTF=0
submit.onclick=function(){
    if(passTF==1){

        loginTF=1;
        console.log(loginTF)
        window.location.href="http://127.0.0.1:5501/readandUpdate/read.html"
    }
    
}