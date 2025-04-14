const express = require("express");
const Notification = require("../models/notifications");
const router = express.Router();

/**
 * ✅ Fetch All Notifications
 */
router.get("/notifications", async (req, res) => {
  try {
    const notifications = await Notification.find().sort({ date: -1 }); // Sorting by date in descending order

    if (notifications.length === 0) {
      return res.status(200).json({
        success: true,
        message: "No notifications found",
        notifications: [],
      });
    }

    res.status(200).json({ success: true, notifications });
  } catch (error) {
    console.error("Error fetching notifications:", error);
    res.status(500).json({ success: false, message: "Server error" });
  }
});

/**
 * ✅ Create a New Notification
 */
router.post("/notifications", async (req, res) => {
  try {
    const { title, description, date } = req.body;

    if (!title || !description) {
      return res.status(400).json({
        success: false,
        message: "All fields (title, description, date) are required",
      });
    }

    const newNotification = new Notification({
      title,
      description,
      date: date || new Date().toISOString(),
    });

    await newNotification.save();

    res.status(201).json({
      success: true,
      message: "Notification created successfully",
      notification: newNotification,
    });

    // 🔴 Emit notification through Socket.IO (optional)
    const io = req.app.get("socketio");
    if (io) {
      io.emit("new_notification", newNotification); // Broadcast to all clients
    }
  } catch (error) {
    console.error("Error creating notification:", error);
    res.status(500).json({ success: false, message: "Server error" });
  }
});

module.exports = router;
