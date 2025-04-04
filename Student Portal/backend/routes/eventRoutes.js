const express = require("express");
const { teacherDB } = require("../config/dbConnections");
const EventSchema = require("../models/events").schema;

const router = express.Router();

// ✅ Define Event model for teacher_portal
const Event = teacherDB.model("Event", EventSchema);

/**
 * ✅ Fetch All Events
 */
router.get("/events", async (req, res) => {
  try {
    const events = await Event.find();

    if (events.length === 0) {
      return res
        .status(200)
        .json({ success: true, message: "No events found", events: [] });
    }

    res.status(200).json({ success: true, events });
  } catch (error) {
    console.error("Error fetching events:", error);
    res.status(500).json({ success: false, message: "Server error" });
  }
});

/**
 * ✅ Fetch Latest Event (Notifications)
 */
router.get("/notifications", async (req, res) => {
  try {
    const latestEvent = await Event.findOne().sort({ _id: -1 });

    if (!latestEvent) {
      return res
        .status(200)
        .json({ success: true, message: "No new events", event: null });
    }

    res.status(200).json({ success: true, event: latestEvent });
  } catch (error) {
    console.error("Error fetching notifications:", error);
    res.status(500).json({ success: false, message: "Server error" });
  }
});

module.exports = router;
