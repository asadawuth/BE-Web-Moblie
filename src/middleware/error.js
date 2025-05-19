// module.exports = (err, req, res, next) => {
//   if (err.name === "ValidationError") {
//     err.statusCode = 400;
//   }
//   res.status(err.statusCode || 500).json({ message: err.message });
// };

module.exports = (err, req, res, next) => {
  const status = err.statusCode || err.status || 500;
  console.error("❌ Error:", err.message);
  res.status(status).json({ message: err.message });
};
