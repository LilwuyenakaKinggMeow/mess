const Location = require('../models/location.model');

const locationController = {
    // Lấy danh sách tất cả các địa điểm
    getLocation: async (req, res) => {
        try {
            const locations = await Location.find();
            res.status(200).json(locations);
        } catch (err) {
            res.status(500).json({ message: 'Error fetching locations', error: err.message });
        }
    },

    // Tạo mới một địa điểm
    createLocation: async (req, res) => {
        try {
            const location = new Location(req.body);
            const savedLocation = await location.save();
            res.status(201).json(savedLocation);
        } catch (err) {
            res.status(500).json({ message: 'Error creating location', error: err.message });
        }
    },

    // Xóa tất cả địa điểm
    deleteAllLocations: async (req, res) => {
        try {
            const result = await Location.deleteMany({}); // Xóa tất cả các địa điểm
            res.status(200).json({ message: 'All locations deleted successfully', result });
        } catch (err) {
            res.status(500).json({ message: 'Error deleting all locations', error: err.message });
        }
    }
}

module.exports = locationController;
