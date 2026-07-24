const express = require("express");

const app = express();

const PORT = 3000;

app.get("/", (req, res) => {
    res.send("🚀 Docker Container is Running Successfully!");
});

app.listen(PORT, () => {
    console.log(`Application running on port ${PORT}`);
});