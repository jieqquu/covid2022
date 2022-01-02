const express =require('express');
const mysql = require('mysql');
const dotenv = require('dotenv');
const app = express();
const bodyParser=require("body-parser");
const res = require("express/lib/response");

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))

app.all("*",function(req,res,next){
    res.header("Access-Control-Allow-Origin","*")
    res.header("Access-Control-Allow-Headers","X-Requested-With,Content-Type")
    res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS")
    next();
})

//Body server
app.use(express.json());
app.use(express.urlencoded({extended: false }));

/*
app.use((req,res,next) => {
    res.header('Access-Control-Allow-Origin','*')
    res.header('Access-Control-Allow-Credentials','false')
    next()
});
*/

//Mysql connection
const myDB = mysql.createConnection({
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'covid'
});

myDB.connect((err) => {
    if(!err)
        console.log("DB connection success");
    else
        console.log("DB connection failed \n Error :" + JSON.stringify(err, undefined, 2));
});

//login
app.post("/", function(req,res){
    let { email,serial_number } = req.body;
    console.log(`email`,`serial_number`);
    let myQuery = `SELECT * FROM patient WHERE email = '${email}' and serial_number = '${serial_number}'`;
    myDB.query(myQuery, (error, results) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(200).json(results);
    });
});


//取得病患個案資料
/*
app.get('/api/covid/:serial_number', (req, res) => {
    let {serial_number} = req.params;
    console.log(`serial_number`);
    //Quert
    let myQuery = `SELECT * FROM patient WHERE serial_number = '${serial_number}' `;
    //run the query
    myDB.query(myQuery, (error, results) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(200).json(results);
    });
});
*/

    
//delete an case (內網聯外網的時候)
app.put('/api/deletecase/:id_number', (req, res) => {
    let {id_number} = req.params;
    console.log(id_number);
    //Query
    let myQuery =`UPDATE patient SET deleted =  1 WHERE id_number = '${id_number}'`;

    myDB.query(myQuery, (error, results) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(200).json(results);
    });
});


//POST Create patient Route
app.post('/api/patient/create', (req, res) => {
    //Title case3 from request
    
    const { id_number,birth_date,sex,name,date,email, infect_covid , infect_date , treatment_place , oxygen_treatment , ICU_treatment, 
        discharged_date, revisit, revisit_division, deal_with} = req.body;
    console.log(email,birth_date,sex,name,date, id_number, infect_covid, infect_date, treatment_place, oxygen_treatment,
     ICU_treatment, discharged_date, revisit, revisit_division, deal_with);
    
   console.log(req.body)
   res.setHeader("Access-Control-Allow-Origin","*")
   response.send("hello express")
     //Query
    /*
    let myQuery = `INSERT INTO patient(email,birth_date,sex,name,date, id_number, infect_covid, infect_date, treatment_place, oxygen_treatment, 
        ICU_treatment, discharged_date, revisit, revisit_division, deal_with) 
        VALUES ('${email}','${birth_date}','${sex}' ,'${name}','${date}','${id_number}', '${infect_covid}', '${infect_date}', '${treatment_place}',
         '${oxygen_treatment}','${ICU_treatment}','${discharged_date}','${revisit}','${revisit_division}','${deal_with}')`;
    */
    //run the query
    myDB.query(myQuery, (error, result) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(201).json(result);
    });
});
     

//Update (創建後加入序號)
app.put('/api/updatecase/:id_number', (req, res) => {
    //Title case2 from request
    let {id_number} = req.params;
    console.log(id_number);
    //Query
    let myQuery = `UPDATE patient SET serial_number = floor(rand()*999999) WHERE id_number = '${id_number}'`;
    //run the query
    myDB.query(myQuery, (error, result) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(201).json(result);
    });
});

//Update (創建後狀刪除)
app.put('/api/deleted/:id_number', (req, res) => {
    //Title case2 from request
    let {id_number} = req.params;
    console.log(id_number);
    //Query
    let myQuery = `UPDATE patient SET deleted = 0 WHERE id_number = '${id_number}' and deleted is null`;
    //run the query
    myDB.query(myQuery, (error, result) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(201).json(result);
    });
});



//病患更改資料
app.put('/api/updatedata/:email', (req, res) => {
    let { id_number,birth_date,sex,name,date,email, infect_covid , infect_date , treatment_place , oxygen_treatment , ICU_treatment, 
        discharged_date, revisit, revisit_dicision, deal_with } = req.body;
    console.log(email);
    //Query
    let myQuery = `UPDATE patient SET id_number = '${id_number}',birth_date = '${birth_date}',sex = '${sex}',name = '${name}',
     date = '${date}', infect_covid = '${infect_covid}', infect_date = '${infect_date}', treatment_place = '${treatment_place}', 
     oxygen_treatment = '${oxygen_treatment}', ICU_treatment = '${ICU_treatment}', discharged_date = '${discharged_date}', revisit = '${revisit}', 
     revisit_dicision = '${revisit_dicision}', deal_with = '${deal_with}'
        WHERE email = '${email}'`;
    //run the query
    myDB.query(myQuery, (error, result) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(201).json(result);
    });
});  


//Server listner
let PORT = process.env.PORT || 3007;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));