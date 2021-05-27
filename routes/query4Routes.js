const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/author', (req, res, next) => {
    try {
        connection.query(`CALL author();`, (error, results, fields) => {
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

router.get('/author_century/:century_name', (req, res, next) => {
    try {
        connection.query(`CALL author_century(?);`, [req.params.century_name], (error, results, fields) => {
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

router.get('/author_country/:country_name', (req, res, next) => {
    try {
        connection.query(`CALL author_country(?);`, [req.params.country_name], (error, results, fields) => {
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

router.get('/author_genre/:genre_name', (req, res, next) => {
    try {
        connection.query(`CALL author_genre(?);`, [req.params.genre_name], (error, results, fields) => {
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

router.get('/author_genre_played/:genre_name', (req, res, next) => {
    try {
        connection.query(`CALL author_genre_played(?);`, [req.params.genre_name], (error, results, fields) => {
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

router.get('/author_period/:date_min/:date_max', (req, res, next) => {
    try {
        connection.query(`CALL author_period(?,?);`, [req.params.date_min, req.params.date_max], (error, results, fields) => {
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