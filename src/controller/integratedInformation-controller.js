const prisma = require("../model/prisma.js");
const {
  createNowDataIntegratedInformation,
} = require("../validator/validator-integratedInformation.js");
exports.getDataIntegratedInformation = async (req, res, next) => {
  try {
    const dataBefore = await prisma.integratedinformation.findFirst({
      orderBy: {
        createdAt: "desc",
      },
      include: {
        user: {
          select: {
            firstName: true,
            lastName: true,
            status: true,
          },
        },
      },
    });
    res.status(200).json({ dataBefore });
  } catch (error) {
    next(error);
  }
};

exports.updataDataIntegratedInformation = async (req, res, next) => {
  try {
    const userId = req.user?.id;
    const { value, error } = createNowDataIntegratedInformation.validate(
      req.body
    );
    if (error) {
      return next(error);
    }

    const updatesData = await prisma.integratedinformation.create({
      data: {
        male: value.male,
        female: value.female,
        household: value.household,
        store: value.store,
        restaurant: value.restaurant,
        place: value.place,
        accommodation: value.accommodation,
        userId: userId,
      },
    });

    res.status(200).json({ updatesData });
  } catch (error) {
    next(error);
  }
};

exports.saveDataIntegratedInformationExcel = async (req, res, next) => {
  try {
    // ดึงข้อมูลล่าสุด
    const latestData = await prisma.integratedinformation.findFirst({
      orderBy: {
        createdAt: "desc",
      },
      include: {
        user: {
          select: {
            firstName: true,
            lastName: true,
            status: true,
          },
        },
      },
    });

    if (!latestData) {
      return res.status(404).json({ message: "ไม่พบข้อมูล" });
    }

    // สร้าง Workbook
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("Latest Data");

    // กำหนด Header
    worksheet.columns = [
      { header: "Male", key: "male", width: 10 },
      { header: "Female", key: "female", width: 10 },
      { header: "Household", key: "household", width: 15 },
      { header: "Store", key: "store", width: 10 },
      { header: "Restaurant", key: "restaurant", width: 15 },
      { header: "Place", key: "place", width: 10 },
      { header: "Accommodation", key: "accommodation", width: 15 },
      { header: "User First Name", key: "firstName", width: 15 },
      { header: "User Last Name", key: "lastName", width: 15 },
      { header: "User Status", key: "status", width: 10 },
      { header: "Created At", key: "createdAt", width: 20 },
    ];

    // เพิ่มข้อมูลลงใน Excel
    worksheet.addRow({
      male: latestData.male,
      female: latestData.female,
      household: latestData.household,
      store: latestData.store,
      restaurant: latestData.restaurant,
      place: latestData.place,
      accommodation: latestData.accommodation,
      firstName: latestData.user.firstName,
      lastName: latestData.user.lastName,
      status: latestData.user.status,
      createdAt: latestData.createdAt,
    });

    // ตั้งค่า Header สำหรับการดาวน์โหลดไฟล์
    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );
    res.setHeader(
      "Content-Disposition",
      "attachment; filename=LatestData.xlsx"
    );

    // ส่งไฟล์ Excel กลับไป
    await workbook.xlsx.write(res);
    res.status(200).end();
  } catch (error) {
    next(error);
  }
};
