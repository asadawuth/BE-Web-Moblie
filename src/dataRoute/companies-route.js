const express = require("express");
const router = express.Router();
const companiesController = require("../controller/companies-controller");
const { authenticated } = require("../middleware/auth");
const uploadMiddleware = require("../middleware/upload");

router.patch(
  "/updated",
  authenticated,
  uploadMiddleware.fields([{ name: "images", maxCount: 5 }]),
  companiesController.updatedDataInCompanies
);

router.get(
  "/datacompanies",
  authenticated,
  companiesController.dataForPopulation
);

router.delete(
  "/datacompanies-deleteImage",
  authenticated,
  companiesController.deleteImage
);

module.exports = router;
