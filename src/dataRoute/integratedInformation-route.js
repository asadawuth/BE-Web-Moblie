const express = require("express");
const router = express.Router();
const integratedInformation = require("../controller/integratedInformation-controller");
const { authenticated } = require("../middleware/auth");

// Render Data  UpdateData integratedInformation UpdateData Excel
router.get(
  "/DataIntegratedInformation",
  authenticated,
  integratedInformation.getDataIntegratedInformation
);
router.post(
  "/UpdateDataIntegratedInformation",
  authenticated,
  integratedInformation.updataDataIntegratedInformation
);

/*
router.post(
  "/SaveLatestFileDataIngratedInformation",
  authenticated,
  integratedInformation.saveDataIntegratedInformationExcel
);
*/

module.exports = router;
