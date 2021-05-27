const { Router } = require('express');
const connection = require('../app/db.config');

const router = Router();

router.get('/rolee/:role_name', (req, res, next) => {
    try {
        connection.query(`CALL rolee(?);`, [req.params.role_name], (error, results, fields) => {
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