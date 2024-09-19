const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello World! Deployed on VPS with Nginx, Docker, and PostgreSQL!');
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
