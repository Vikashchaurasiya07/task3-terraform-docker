const express = require("express");
const path = require("path");
const app = express();

// Serve static files like CSS from "styles" folder
app.use("/styles", express.static(path.join(__dirname, "styles")));

// Serve the main HTML file
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`🚀 InspireMe app is running at http://localhost:${PORT}`);
});
