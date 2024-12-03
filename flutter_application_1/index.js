const express = require('express');
const app = express();
const cors = require('cors');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
require('dotenv').config();

// Environment variables
const PORT = process.env.PORT || 7777;
const MONGODB_URL = process.env.MONGODB_URL || 'mongodb+srv://messiga:messiga@login.i4nnz.mongodb.net/?retryWrites=true&w=majority&appName=login';

// Middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());
  
// MongoDB Connection
mongoose.connect(MONGODB_URL,)
  .then(() => console.log('ok'))
  .catch((error) => {
    console.error('Lỗi khi kết nối tới MongoDB:', error);
    process.exit(1); // Exit the program with an error code
  });

// Routes
const locationRoute = require('./api/routes/location.route');
app.use("/v1/api/location", locationRoute);
 
// Server Start
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
