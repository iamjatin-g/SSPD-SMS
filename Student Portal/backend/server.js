const express = require("express");
const cors = require("cors");

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Dummy notifications data
const notifications = [
  {
    id: "1",
    title: "Mr. Jatin Send Announcement",
    description: "Holiday on 26 Feb",
    date: "15 Feb 2025",
  },
  {
    id: "2",
    title: "Mr. John Parents Send Leave Request",
    description: "Leave Request on 21 Feb",
    date: "14 Feb 2025",
  },
];

// API Endpoint to get notifications
app.get("/notifications", (req, res) => {
  res.json(notifications);
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
