const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/performance_list/:performance_name', (req, res, next) => {
    try {
        connection.query(`CALL performance_list(?);`, [req.params.performance_name], (error, results, fields) => {
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