const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/staff', (req, res, next) => {
    try {
        connection.query(`CALL personal();`, (error, results, fields) => {
            if(error){
                res.json({ message: error });
            }else{
                res.json({ query_result: results });
            }
        })
    } catch(err) {
        console.log("error");
        next(err);
    }
});

router.get('/actors', (req, res, next) => {
    try {
        connection.query(`CALL actors();`, (error, results, fields) => {
            if(error){
                res.json({ message: error });
            }else{
                res.json({ query_result: results });
            }
        })
    } catch(err) {
        console.log("error");
        next(err);
    }
});

router.get('/musicians', (req, res, next) => {
    try {
        connection.query(`CALL musicians();`, (error, results, fields) => {
            if(error){
                res.json({ message: error });
            }else{
                res.json({ query_result: results });
            }
        })
    } catch(err) {
        console.log("error");
        next(err);
    }
});

router.get('/staff_by_exp', (req, res, next) => {
    try {
        connection.query(`CALL experience();`, (error, results, fields) => {
            if(error){
                res.json({ message: error });
            }else{
                res.json({ query_result: results });
            }
        })
    } catch(err) {
        console.log("error");
        next(err);
    }
});

router.get('/staff_by_sex/:sex', (req, res, next) => {
    try {
        connection.query(`CALL sex(?);`, [req.params.sex], (error, results, fields) => {
            if(error){
                res.json({ message: error });
            }else{
                res.json({ query_result: results });
            }
        })
    } catch(err) {
        console.log("error");
        next(err);
    }
});

router.get('/staff_by_date_of_birth/:date_of_birth', (req, res, next) => {
    try {
        connection.query(`CALL year_of_birth(?);`, [req.params.date_of_birth], (error, results, fields) => {
            if(error){
                res.json({ message: error });
            }else{
                res.json({ query_result: results });
            }
        })
    } catch(err) {
        console.log("error");
        next(err);
    }
});

router.get('/staff_by_age/:age', (req, res, next) => {
    try {
        connection.query(`CALL age(?);`, [`${req.params.age}`], (error, results, fields) => {
            if(error){
                res.json({ message: error });
            }else{
                res.json({ query_result: results });
            }
        })
    } catch(err) {
        console.log("error");
        next(err);
    }
});

router.get('/staff_by_children/:childrenAvail', (req, res, next) => {
    try {
        connection.query(`CALL children(?);`, [req.params.childrenAvail], (error, results, fields) => {
            if(error){
                res.json({ message: error });
            }else{
                res.json({ query_result: results });
            }
        })
    } catch(err) {
        console.log("error");
        next(err);
    }
});

router.get('/staff_by_salary/:salary', (req, res, next) => {
    try {
        connection.query(`CALL salary(?);`, [req.params.salary], (error, results, fields) => {
            if(error){
                res.json({ message: error });
            }else{
                res.json({ query_result: results });
            }
        })
    } catch(err) {
        console.log("error");
        next(err);
    }
});

module.exports = router;