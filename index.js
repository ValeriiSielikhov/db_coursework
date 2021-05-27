const express = require('express')
require('./app/db.config');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const routes = require('./routes/index');
routes(app);
const port = 3050;

app.listen(port, () => {
  console.log(`Application running at http://localhost:${port}`)
})