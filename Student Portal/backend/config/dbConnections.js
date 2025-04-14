const mongoose = require("mongoose");
require("dotenv").config();

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
const teacherDB = mongoose.createConnection(process.env.TEACHER_MONGO_URI);

teacherDB.on("connected", () =>
  console.log("✅ Connected to teacher_portal database")
);
teacherDB.on("error", (err) =>
  console.error("❌ Teacher DB Connection Error:", err)
);

module.exports = { teacherDB };
