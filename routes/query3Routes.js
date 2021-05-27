const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/played_genre/:genre_name', (req, res, next) => {
    try {
        connection.query(`CALL played_genre(?);`, [req.params.genre_name], (error, results, fields) => {
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

router.get('/played_period_genre/:date_min/:date_max/:genre_name', (req, res, next) => {
    try {
        connection.query(`CALL played_period_genre(?,?,?);`, [req.params.date_min, req.params.date_max, req.params.genre_name], (error, results, fields) => {
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