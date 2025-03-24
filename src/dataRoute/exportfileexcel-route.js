const express = require("express");
const router = express.Router();
const exportfileexcel = require("../controller/exportfileexcel-controller");
const { authenticated } = require("../middleware/auth");

router.post(
  "/dataexcel-userreport/:startDate/:endDate",
  authenticated,
  exportfileexcel.dataReportExcel
);
router.post(
  "/dataexcel-shoprequest/:startDate/:endDate",
  authenticated,
  exportfileexcel.dataShopExcel
);
router.post(
  "/dataexcel-requestcctv/:startDate/:endDate",
  authenticated,
  exportfileexcel.dataReuestcctvExcel
);
router.post(
  "/dataexcel-requestsos/:startDate/:endDate",
  authenticated,
  exportfileexcel.dataReportsosExcel
);
router.post(
  "/dataexcel-dataintegratedInformationExcel/:startDate/:endDate",
  authenticated,
  exportfileexcel.dataIntegratedInformationExcel
);

module.exports = router;
