const prisma = require("../model/prisma.js");
const ExcelJS = require("exceljs");
const createError = require("../middleware/error.js");
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

/*
exports.saveDataIntegratedInformationExcel = async (req, res, next) => {
  try {
    // 👉 ดึงข้อมูลล่าสุดจากฐานข้อมูล
    const latestData = await prisma.integratedinformation.findFirst({
      orderBy: { createdAt: "desc" },
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
      return next(createError("Data is not found.", 404));
    }

    // 👉 ลบ `userId` และ `user` ออกจากคอลัมน์
    let columnNames = Object.keys(latestData).filter(
      (col) => col !== "userId" && col !== "user"
    );

    // 👉 เพิ่ม `firstName`, `lastName`, `status` ลงในคอลัมน์
    columnNames.push("firstName", "lastName", "status");

    // 👉 สร้าง Workbook และ Worksheet
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("Integrated Data");

    // 👉 เพิ่มชื่อคอลัมน์ลงไป
    worksheet.addRow(columnNames);

    // 👉 แปลง `createdAt` เป็น string ที่อ่านง่าย
    const rowData = columnNames.map((col) => {
      if (col === "createdAt") {
        return new Date(latestData[col])
          .toISOString()
          .replace("T", " ")
          .slice(0, 19); // แปลงเป็น `YYYY-MM-DD HH:mm:ss`
      }
      if (col === "firstName") return latestData.user?.firstName || "";
      if (col === "lastName") return latestData.user?.lastName || "";
      if (col === "status") return latestData.user?.status || "";
      return latestData[col]; // ข้อมูลอื่น ๆ
    });

    worksheet.addRow(rowData);

    // 👉 ปรับความกว้างของคอลัมน์ให้อ่านง่ายขึ้น
    worksheet.columns.forEach((column) => {
      column.width = 20; // ปรับความกว้างของทุกคอลัมน์เป็น 20
    });

    // 👉 ตั้งค่า response ให้ Postman ดาวน์โหลดไฟล์ Excel
    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );
    res.setHeader(
      "Content-Disposition",
      "attachment; filename=IntegratedInformation.xlsx"
    );

    // 👉 ส่งไฟล์ Excel กลับไปให้ Postman
    await workbook.xlsx.write(res);
    res.end();
  } catch (error) {
    next(error);
  }
};
*/
