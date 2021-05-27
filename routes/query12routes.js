const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/money_for_performance/:performance_name', (req, res, next) => {
    try {
        connection.query(`CALL money_for_performance(?);`, [req.params.performance_name], (error, results, fields) => {
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

router.get('/money_for_period/:date_min/:date_max', (req, res, next) => {
    try {
        connection.query(`CALL money_for_period(?,?);`, [req.params.date_min, req.params.date_max], (error, results, fields) => {
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