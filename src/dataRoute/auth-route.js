const express = require("express");
const router = express.Router();
const authController = require("../controller/auth-controller");
const { authenticated } = require("../middleware/auth");
const uploadMiddleware = require("../middleware/upload");

// REGISTER LOGIN GETDATAUSER UPDATEDATAUSER UPDATEPROFILE SETDEFAULTPROFILE
router.post("/createIdEmployee", authController.registerIdEmployee);
router.post("/login", authController.login);
router.post("/loginpopulation", authController.loginPopulation);
router.get("/getdata", authenticated, authController.getUserAuth);
router.patch("/updateDataId", authenticated, authController.updateDataId);
router.patch(
  "/updateProfile",
  authenticated,
  uploadMiddleware.single("imageProfile"),
  authController.updateProfile
);
router.patch(
  "/changeProfiletoDefaultImage",
  authenticated,
  authController.changeProfileToDefaultImage
);
// SEARCH FOR DELETE ID ใช้กับพนักงานที่พ้นสภาพ และ ของประชาชนที่สร้างปัญหาให้ระบบ
// สถานะ resign และ บล็อค จะไม่สามารถเข้าระบบได้
router.get(
  "/getForDeleteIdLoginEmployee/:firstName/:lastName",
  authenticated,
  authController.getForDeleteIdLoginEmployee
);
router.delete(
  "/deleteIdEmployee/:employeeIdLogin",
  authenticated,
  authController.deleteIduserEmployee
);
router.delete(
  "/deleteIdPoppulation/:populationIdLogin",
  authenticated,
  authController.deleteIdUserPoppulation
);
// CHANGEUSERPASSWORDANDEMAIL
router.patch(
  "/changepassworduser",
  authenticated,
  authController.changePassword
);
router.patch("/changeemail", authenticated, authController.changeEmail);
// ABOUT FORGOTPASSWORD OTP 4 LENGHT
router.post("/verifyemail", authController.verifyEmail);
router.post("/createotp", authController.createOtp);
router.post("/verifyotp", authController.verifyOtp);
router.patch("/resetpassword", authController.resetPassword);
// DATA USER EMPLOYEE EMPLOYEERESIGN POPULATION POPULATIONBLOCK
router.get("/data-employee", authenticated, authController.dataEmployAlly);
router.get("/data-population", authenticated, authController.dataPopulation);
router.get(
  "/data-employee-resign",
  authenticated,
  authController.dataEmployeeResign
);
router.get(
  "/data-population-block",
  authenticated,
  authController.dataPopulationBlock
);
// SEARCH DATA ID USER
router.get(
  "/data-userId/:firstName/:lastName",
  authenticated,
  authController.dataUserId
);

module.exports = router;
