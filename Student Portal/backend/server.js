const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
require("dotenv").config();

const User = require("./models/users"); // ✅ User Model (student_portal)
const EventSchema = require("./models/events").schema; // ✅ Import only Schema (not model)

const app = express();
const PORT = 3000;

// ✅ Middleware
app.use(cors());
app.use(bodyParser.json());

/**
 * ✅ Connect to student_portal (Login System)
 */
mongoose
  .connect(process.env.MONGO_URI)
  .then(() => console.log("✅ Connected to student_portal database"))
  .catch((err) => console.error("❌ Student DB Connection Error:", err));

/**
 * ✅ Connect to teacher_portal (Events)
 */
const teacherDB = mongoose.createConnection(process.env.TEACHER_MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

teacherDB.on("connected", () =>
  console.log("✅ Connected to teacher_portal database")
);
teacherDB.on("error", (err) =>
  console.error("❌ Teacher DB Connection Error:", err)
);

// ✅ Define Event model for teacher_portal
const Event = teacherDB.model("Event", EventSchema);

/**
 * ✅ Register API (student_portal)
 */
app.post("/register", async (req, res) => {
  const { username, password } = req.body;

  try {
    const existingUser = await User.findOne({ username });
    if (existingUser) {
      return res
        .status(400)
        .json({ success: false, message: "User already exists" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = new User({ username, password: hashedPassword });
    await newUser.save();

    res
      .status(201)
      .json({ success: true, message: "User registered successfully" });
  } catch (error) {
    console.error("Registration Error:", error);
    res.status(500).json({ success: false, message: "Server error" });
  }
});

/**
 * ✅ Login API (student_portal)
 */
app.post("/login", async (req, res) => {
  const { username, password } = req.body;

  try {
    const user = await User.findOne({ username });

    if (!user) {
      return res
        .status(401)
        .json({ success: false, message: "Invalid credentials" });
    }

    const passwordMatch = await bcrypt.compare(password, user.password);
    if (!passwordMatch) {
      return res
        .status(401)
        .json({ success: false, message: "Invalid credentials" });
    }

    // ✅ Send userId along with token
    const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET, {
      expiresIn: "1h",
    });

    res.status(200).json({
      success: true,
      message: "Login successful",
    });
  } catch (error) {
    console.error("Login Error:", error);
    res.status(500).json({ success: false, message: "Server error" });
  }
});

app.get("/events", async (req, res) => {
  try {
    const events = await Event.find();
    // console.log("🔍 Events found:", events); // ✅ Debugging line

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

app.get("/notifications", async (req, res) => {
  try {
    const latestEvent = await Event.findOne().sort({ _id: -1 }); // Fetch latest event

    if (!latestEvent) {
      return res.status(200).json({ success: true, message: "No new events", event: null });
    }

    res.status(200).json({ success: true, event: latestEvent });
  } catch (error) {
    console.error("Error fetching notifications:", error);
    res.status(500).json({ success: false, message: "Server error" });
  }
});


/**
 * ✅ Start Server
 */
app.listen(PORT, "0.0.0.0", () => {
  console.log(`✅ Server running on port ${PORT}`);
});
