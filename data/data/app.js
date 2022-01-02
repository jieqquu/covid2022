
const express =require('express');
const mysql = require('mysql');
const dotenv = require('dotenv');
dotenv.config();
//app
const app = express();
//Body server
app.use(express.json());
app.use(express.urlencoded({extended: false }));

//API
app.use((req,res,next) => {
    res.header('Access-Control-Allow-Origin','*')
    res.header('Access-Control-Allow-Credentials','false')
    next()
});

//Mysql connection
const myDB = mysql.createConnection({
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'covidin'
});

myDB.connect((err) => {
    if(!err)
        console.log("DB connection success");
    else
        console.log("DB connection failed \n Error :" + JSON.stringify(err, undefined, 2));
});

//取得全部病患個案資料
app.get('/api/covid', (req, res) => {
    let { rowid } = req.params;
    console.log(rowid);
    //Quert
    let myQuery = `SELECT * FROM case3 JOIN patient ON (case3.id_number = patient.id_number)`;
    //run the query
    myDB.query(myQuery, (error, results) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(200).json(results);
    });
});




app.get('/api/get/date/:date', (req, res) => {
    let { date } = req.params;
    console.log(date);
    //Quert
    let myQuery = `SELECT * FROM case3 join patient on case3.id_number = patient.id_number WHERE date = ${date}`;
    //run the query
    myDB.query(myQuery, (error, results) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(200).json(results);
    });
});

//Get single case Routes
app.get('/api/covid/select/:medical_record_number', (req, res) => {
    let { medical_record_number } = req.params;
    console.log(medical_record_number);
    //Quert
    let myQuery = 
    `SELECT * FROM patient join case3 on (patient.id_number = case3.id_number) WHERE medical_record_number = '${medical_record_number}'`;
    //run the query
    myDB.query(myQuery, (error, results) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(200).json(results);
    });
});
    
//delete an case
app.put('/api/deletecase/:id_number', (req, res) => {
    let {id_number} = req.params;
    console.log(id_number);
    //Query
    let myQuery =`UPDATE case3 SET deleted =  1 WHERE id_number = '${id_number}'`;

    myDB.query(myQuery, (error, results) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(200).json(results);
    });
});

//POST Create patient Route
app.post('/api/createpatient', (req, res) => {
    //Title case2 from request
    const { medical_record_number, name, NHI_number, id_number, birth_date, sex } = req.body;
    console.log(medical_record_number, name, NHI_number, id_number, birth_date, sex);
    //Query
    let myQuery = `INSERT INTO patient(medical_record_number, name, NHI_number, id_number, birth_date, sex) 
        VALUES ('${medical_record_number}' ,'${name}', '${NHI_number}', '${id_number}', '${birth_date}', '${sex}')`;
    //run the query
    myDB.query(myQuery, (error, result) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(201).json(result);
    });
});
     
//POST Create case Route
app.post('/api/createcase', (req, res) => {
    //Title case2 from request
    const {id_number,date, infect_covid, infect_date, treatment_place, oxygen_treatment,ICU_treatment, discharged_date, revisit, revisit_dicision, deal_with,deleted} = req.body;
    console.log(id_number,date, infect_covid, infect_date, treatment_place, oxygen_treatment,ICU_treatment, discharged_date, revisit, revisit_dicision, deal_with,deleted);
    //Query
    let myQuery = `INSERT INTO case3(id_number,date, infect_covid, infect_date, treatment_place, oxygen_treatment,ICU_treatment, discharged_date, revisit, revisit_dicision, deal_with,deleted) 
        VALUES ('${id_number}' ,'${date}', '${infect_covid}', '${infect_date}', '${treatment_place}', '${oxygen_treatment}','${ICU_treatment}','${discharged_date}','${revisit}','${revisit_dicision}','${deal_with}','${deleted}')`;
    //run the query
    myDB.query(myQuery, (error, result) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(201).json(result);
    });
});

//Update
app.put('/api/updatecase/:id_number', (req, res) => {
    //Title case2 from request
    const { date, infect_covid, infect_date, treatment_place, oxygen_treatment, ICU_treatment, discharged_date, revisit, revisit_dicision, deal_with } = req.body;
    const { id_number } = req.params;
    //Query
    let myQuery = `UPDATE case3 SET date = '${date}', infect_covid = '${infect_covid}', infect_date = '${infect_date}', treatment_place = '${treatment_place}', oxygen_treatment = '${oxygen_treatment}', ICU_treatment = '${ICU_treatment}', discharged_date = '${discharged_date}', revisit = '${revisit}', revisit_dicision = '${revisit_dicision}', deal_with = '${deal_with}'
        WHERE id_number = '${id_number}'`;
    //run the query
    myDB.query(myQuery, (error, result) => {
        if (error) {
            return res.status(404).json(error);
        }
        return res.status(201).json(result);
    });
});



//Server listner
let PORT = process.env.PORT || 3006;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));