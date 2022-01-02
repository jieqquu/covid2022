
function getData(value){
    var name=document.getElementById("dataName")
    var req = new XMLHttpRequest();
    var uml=`http://4118-140-136-54-238.ngrok.io/api/covid/${value}`
    console.log(uml)
    req.open("get",uml)
    req.onload=function(){
        let response = JSON.parse(this.response)
        console.log(response)
        name.innerText=response[0].name  
    }    
    req.send();
}

var hisid=document.getElementById("hisid")
hisid.onchange=()=>{
    hisid=hisid.value
    getData(hisid)

}