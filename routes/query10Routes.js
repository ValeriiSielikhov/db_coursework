const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/count_rolee', (req, res, next) => {
    try {
        connection.query(`CALL count_rolee();`, (error, results, fields) => {
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

router.get('/role_actor/:actor_name', (req, res, next) => {
    try {
        connection.query(`CALL role_actor(?);`, [req.params.actor_name], (error, results, fields) => {
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

router.get('/role_period/:actor_name/:date_min/:date_max', (req, res, next) => {
    try {
        connection.query(`CALL role_period(?,?,?);`, [req.params.actor_name, req.params.date_min, req.params.date_max], (error, results, fields) => {
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

router.get('/role_genre/:actor_name/:genre_name', (req, res, next) => {
    try {
        connection.query(`CALL role_genre(?,?);`, [req.params.actor_name, req.params.genre_name], (error, results, fields) => {
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

router.get('/actor_regiser/:actor_name/:director_name', (req, res, next) => {
    try {
        connection.query(`CALL actor_regiser(?,?);`, [req.params.actor_name, req.params.director_name], (error, results, fields) => {
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

router.get('/role_age/:actor_name/:age_category', (req, res, next) => {
    try {
        connection.query(`CALL role_age(?,?);`, [req.params.actor_name, req.params.age_category], (error, results, fields) => {
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