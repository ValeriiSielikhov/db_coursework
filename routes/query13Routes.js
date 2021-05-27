const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/place', (req, res, next) => {
    try {
        connection.query(`CALL place();`, (error, results, fields) => {
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

router.get('/place_performance/:performance_name', (req, res, next) => {
    try {
        connection.query(`CALL place_performance(?);`, [req.params.performance_name], (error, results, fields) => {
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

router.get('/place_premiere', (req, res, next) => {
    try {
        connection.query(`CALL place_premiere();`, (error, results, fields) => {
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