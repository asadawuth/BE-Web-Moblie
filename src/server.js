require("dotenv").config();
const express = require("express");
const app = express();
const cors = require("cors");
const morgan = require("morgan");
const range = require("express-range");
const http = require("http");
const { Server } = require("socket.io");

const server = http.createServer(app);
const io = new Server(server, {
  path: "/socket.io",
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
  },
});
app.use(
  cors({
    origin: "*",
    methods: ["GET", "POST", "PUT", "DELETE", "PATCH"],
    credentials: true,
  })
);

app.use("/public", express.static("public"));
app.use("/uploads", range({ accept: "bytes" }), express.static("uploads"));

const notFoundMiddlewear = require("./middleware/not-found.js");
const errorMiddleWear = require("./middleware/error");
const rateLimitMiddlewear = require("./middleware/rate-limit.js");

const authRoute = require("./dataRoute/auth-route.js");
const userReportRoute = require("./dataRoute/userreport-route.js");
const commentReportIdRoute = require("./dataRoute/commentiduserreport-route.js");
const shopRoute = require("./dataRoute/shop-route.js");
const commentShopRoute = require("./dataRoute/commentshop-route.js");
const requestWatchcctvRoute = require("./dataRoute/requestwatchcctv-route.js");
const voiceSosRoute = require("./dataRoute/sosvoice-route.js");
const integratedInformationRoute = require("./dataRoute/integratedInformation-route.js");

app.use(morgan("dev"));
app.use(express.json());
app.use(rateLimitMiddlewear);
app.use("/user", authRoute);
app.use(
  "/boardreport",
  (req, res, next) => {
    req.io = io;
    next();
  },
  userReportRoute
);
app.use("/commentidreport", commentReportIdRoute);
app.use(
  "/aboutshop",
  (req, res, next) => {
    req.io = io;
    next();
  },
  shopRoute
);
app.use("/commentsshop", commentShopRoute);
app.use(
  "/documentsrequestcctv",
  (req, res, next) => {
    req.io = io;
    next();
  },
  requestWatchcctvRoute
);
app.use(
  "/voicesos",
  (req, res, next) => {
    req.io = io;
    next();
  },
  voiceSosRoute
);
app.use("/integratedinformation", integratedInformationRoute);

app.use(notFoundMiddlewear);
app.use(errorMiddleWear);

const PORT = process.env.PORT || 8888;

server.listen(PORT, () => console.log(`Server is running on port ${PORT}`));
