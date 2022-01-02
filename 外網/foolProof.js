let input =document.getElementsByTagName("input");
console.log(input)

function emailFoolProof(input){
    value=input.value;
    let help =document.getElementById("helpBlock")
    let emailrule=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/
    if(value.search(emailrule)!=-1){
        console.log("true")
        input.classList.remove("invalid")
        help.style.display="none"
    }else{
        input.classList.add("invalid")
        help.style.display="block"
        
    }
}


for (let i=0;i<input.length;i++){
    let e=input[i]
    e.onchange=function(){
        type=e.type;
        if(type=="email"){
            emailFoolProof(e)
        }     
    }
}


