const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/performance_genre/:genre_name', (req, res, next) => {
    try {
        connection.query(`CALL performance_genre(?);`, [req.params.genre_name], (error, results, fields) => {
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

router.get('/performance_author/:author_name', (req, res, next) => {
    try {
        connection.query(`CALL performance_author(?);`, [req.params.author_name], (error, results, fields) => {
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

router.get('/performance_country/:country_name', (req, res, next) => {
    try {
        connection.query(`CALL performance_country(?);`, [req.params.country_name], (error, results, fields) => {
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

router.get('/performance_century/:century_name', (req, res, next) => {
    try {
        connection.query(`CALL performance_century(?);`, [req.params.century_name], (error, results, fields) => {
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

router.get('/first_performance/:date_min/:date_max', (req, res, next) => {
    try {
        connection.query(`CALL first_performance(?,?);`, [req.params.date_min, req.params.date_max], (error, results, fields) => {
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