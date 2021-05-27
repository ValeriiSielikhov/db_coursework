const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/tour_coming/:date_min/:date_max', (req, res, next) => {
    try {
        connection.query(`CALL tour_coming(?,?);`, [req.params.date_min, req.params.date_max], (error, results, fields) => {
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

router.get('/tour_outcoming/:date_min/:date_max/:performance_name', (req, res, next) => {
    try {
        connection.query(`CALL tour_outcoming(?,?,?);`, [req.params.date_min, req.params.date_max, req.params.performance_name], (error, results, fields) => {
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