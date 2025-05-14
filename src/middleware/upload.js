const fs = require("fs");
const multer = require("multer");

const dir = "public";
if (!fs.existsSync(dir)) {
  fs.mkdirSync(dir);
}

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "public");
  },
  filename: (req, file, cb) => {
    const split = file.originalname.split(".");
    cb(
      null,
      Date.now() +
        Math.round(Math.random() * 10000) +
        "." +
        split[split.length - 1],
    );
  },
});

const upload = multer({ storage: storage });
module.exports = upload;
