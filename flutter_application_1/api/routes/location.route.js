
const express = require('express');
const router = express.Router();
const locationController = require('../controllers/location.controller');

// Lấy danh sách tất cả địa điểm
router.get('/', locationController.getLocation);

// Tạo mới một địa điểm
router.post('/create', locationController.createLocation);
router.delete('/deleteAll', locationController.deleteAllLocations);

module.exports = router;