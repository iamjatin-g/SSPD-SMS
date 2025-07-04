const mongoose = require("mongoose");

const eventSchema = new mongoose.Schema({
  name: { type: String, required: true },
  date: { type: String, required: true },
  venue: { type: String, required: true },
  managedBy: { type: String, required: true },
});

module.exports = mongoose.model("Event", eventSchema);
