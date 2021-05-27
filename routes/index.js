const query1Routes = require('./query1Routes');
const query2Routes = require('./query2Routes');
const query3Routes = require('./query3Routes');
const query4Routes = require('./query4Routes');
const query5Routes = require('./query5Routes');
const query6Routes = require('./query6Routes');
const query7Routes = require('./query7Routes');
const query8Routes = require('./query8Routes');
const query9Routes = require('./query9Routes');
const query10Routes = require('./query10Routes');
const query11Routes = require('./query11Routes');
const query12Routes = require('./query12Routes');
const query13Routes = require('./query13Routes');

module.exports = (app) => {
    app.use('/query1', query1Routes);
    app.use('/query2', query2Routes);
    app.use('/query3', query3Routes);
    app.use('/query4', query4Routes);
    app.use('/query5', query5Routes);
    app.use('/query6', query6Routes);
    app.use('/query7', query7Routes);
    app.use('/query8', query8Routes);
    app.use('/query9', query9Routes);
    app.use('/query10', query10Routes);
    app.use('/query11', query11Routes);
    app.use('/query12', query12Routes);
    app.use('/query13', query13Routes);
  };