const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/rankk', (req, res, next) => {
    try {
        connection.query(`CALL rankk();`, (error, results, fields) => {
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

router.get('/rank_period/:date_min/:date_max', (req, res, next) => {
    try {
        connection.query(`CALL rank_period(?,?);`, [req.params.date_min, req.params.date_max], (error, results, fields) => {
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

router.get('/rank_getted/:competition_name', (req, res, next) => {
    try {
        connection.query(`CALL rank_getted(?);`, [req.params.competition_name], (error, results, fields) => {
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

router.get('/sex_rank/:sex', (req, res, next) => {
    try {
        connection.query(`CALL sex_rank(?);`, [req.params.sex], (error, results, fields) => {
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

router.get('/rank_age/:age', (req, res, next) => {
    try {
        connection.query(`CALL rank_age(?);`, [req.params.age], (error, results, fields) => {
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