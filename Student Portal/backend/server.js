const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const http = require("http");
const socketIo = require("socket.io");
require("dotenv").config();

// ✅ Import Routes
const authRoutes = require("./routes/authRoutes");
const eventRoutes = require("./routes/eventRoutes");
const notificationRoutes = require("./routes/notificationRoutes");

// ✅ Import Notification Model
const Notification = require("./models/notifications"); // Ensure correct path

const app = express();
const server = http.createServer(app);
const io = socketIo(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
  },
});

const PORT = process.env.PORT || 3000;

// ✅ Attach io to app so it's accessible in routes
app.set("socketio", io);

// ✅ Middleware
app.use(cors());
app.use(bodyParser.json());

// ✅ Use Routes
app.use(authRoutes);
app.use(eventRoutes);
app.use(notificationRoutes);

// ✅ WebSocket Logic for Notifications
io.on("connection", (socket) => {
  console.log("A user connected");

  // Fetch notifications from the database when a user connects
  const fetchNotifications = async () => {
    try {
      const notifications = await Notification.find({}).exec();
      notifications.forEach((notification) => {
        socket.emit("new_notification", {
          title: notification.title,
          description: notification.description,
          date: notification.date,
        });
      });
    } catch (err) {
      console.error("Error fetching notifications:", err);
    }
  };

  // Call the fetchNotifications function on initial connection
  fetchNotifications();

  // Listen for new notifications being added and emit them
  socket.on("new_notification", async (data) => {
    try {
      // Save the notification to the database
      const notification = new Notification({
        title: data.title,
        description: data.description,
        date: new Date(),
      });

      await notification.save();

      // Emit the new notification to all connected clients
      io.emit("new_notification", {
        title: notification.title,
        description: notification.description,
        date: notification.date,
      });
    } catch (err) {
      console.error("Error adding notification:", err);
    }
  });

  socket.on("disconnect", () => {
    console.log("A user disconnected");
  });
});

// ✅ Start Server outside of io.on
server.listen(PORT, "0.0.0.0", () => {
  console.log(`✅ Server running on port ${PORT}`);
});
