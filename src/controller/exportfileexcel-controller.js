const prisma = require("../model/prisma.js");
const ExcelJS = require("exceljs");
const { date } = require("../validator/validator-exportfileexcel.js");
const createError = require("../utils/create-error.js");

exports.dataReportExcel = async (req, res, next) => {
  try {
    const { value, error } = date.validate(req.params);
    if (error) return next(createError("Data is not found", 400));

    const { startDate, endDate } = value; // { start: '2025-04-11', end: '2025-04-18' } เคส ตัวอย่าง เอา - ออก
    const startParts = startDate.split("-"); // startParts = ['2025', '04', '11']
    const endParts = endDate.split("-"); // endParts = [ '2025','04','18' ]

    const start = new Date(
      Date.UTC(startParts[0], startParts[1] - 1, startParts[2], 0, 0, 0)
    ); // '2025' // '04' // '11' // time
    const end = new Date(
      Date.UTC(endParts[0], endParts[1] - 1, endParts[2], 23, 59, 59, 999)
    ); // '2025' // '04' // '18' // time

    const dataUserReport = await prisma.postuserreport.findMany({
      where: {
        createdAt: {
          gte: start,
          lte: end,
        },
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

    if (!dataUserReport || dataUserReport.length === 0) {
      return res.status(404).json({ message: "Data is not found" });
    }

    let columnNames = Object.keys(dataUserReport[0]).filter(
      (col) => col !== "user"
    );
    // เอาตัวที่ include หาตัวที่ไม่ใช่ ีuser เพื่อ เอา user ออกไปก่อน
    columnNames.push("firstName", "lastName", "statusUser");

    const ExcelJS = require("exceljs");
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("dataUserReport");

    worksheet.addRow(columnNames);

    dataUserReport.forEach((item) => {
      const row = columnNames.map((col) => {
        if (col === "createdAt") {
          return new Date(item[col])
            .toISOString()
            .replace("T", " ")
            .slice(0, 19);
        }
        if (col === "firstName") return item.user?.firstName || "";
        if (col === "lastName") return item.user?.lastName || "";
        if (col === "statusUser") return item.user?.status || "";
        return item[col];
      });
      worksheet.addRow(row);
    });

    worksheet.columns.forEach((column) => {
      column.width = 20;
    });

    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );

    const now = new Date();
    const timestamp =
      now.getFullYear().toString() +
      (now.getMonth() + 1).toString().padStart(2, "0") +
      now.getDate().toString().padStart(2, "0") +
      "_" +
      now.getHours().toString().padStart(2, "0") +
      now.getMinutes().toString().padStart(2, "0") +
      now.getSeconds().toString().padStart(2, "0");

    res.setHeader(
      "Content-Disposition",
      `attachment; filename=userReports_${timestamp}.xlsx`
    );

    await workbook.xlsx.write(res);
    res.end();
  } catch (error) {
    next(error);
  }
};

exports.dataShopExcel = async (req, res, next) => {
  try {
    const { value, error } = date.validate(req.params);
    if (error) {
      return next(createError(400, "Date is not valid."));
    }

    const { startDate, endDate } = value;
    const startParts = startDate.split("-");
    const endParts = endDate.split("-");

    const start = new Date(
      Date.UTC(startParts[0], startParts[1] - 1, startParts[2], 0, 0, 0)
    );
    const end = new Date(
      Date.UTC(endParts[0], endParts[1] - 1, endParts[2], 23, 59, 59, 999)
    );

    const dataUserReportShop = await prisma.datashop.findMany({
      where: {
        createdAt: {
          gte: start,
          lte: end,
        },
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

    if (!dataUserReportShop || dataUserReportShop.length === 0) {
      return res.status(404).json({ message: "Data is not found" });
    }

    // เตรียม header column
    let columnNames = Object.keys(dataUserReportShop[0]).filter(
      (col) => col !== "user"
    );
    columnNames.push("firstName", "lastName", "statusUser");

    const ExcelJS = require("exceljs");
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("dataUserReportShop");

    worksheet.addRow(columnNames);

    dataUserReportShop.forEach((item) => {
      const row = columnNames.map((col) => {
        if (col === "createdAt") {
          return new Date(item[col])
            .toISOString()
            .replace("T", " ")
            .slice(0, 19);
        }
        if (col === "firstName") return item.user?.firstName || "";
        if (col === "lastName") return item.user?.lastName || "";
        if (col === "statusUser") return item.user?.status || "";
        return item[col];
      });
      worksheet.addRow(row);
    });

    worksheet.columns.forEach((column) => {
      column.width = 20;
    });

    const now = new Date();
    const timestamp =
      now.getFullYear().toString() +
      (now.getMonth() + 1).toString().padStart(2, "0") +
      now.getDate().toString().padStart(2, "0") +
      "_" +
      now.getHours().toString().padStart(2, "0") +
      now.getMinutes().toString().padStart(2, "0") +
      now.getSeconds().toString().padStart(2, "0");

    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );
    res.setHeader(
      "Content-Disposition",
      `attachment; filename=userReportsShop_${timestamp}.xlsx`
    );

    await workbook.xlsx.write(res);
    res.end();
  } catch (error) {
    next(error);
  }
};

exports.dataReuestcctvExcel = async (req, res, next) => {
  try {
    const { value, error } = date.validate(req.params);
    if (error) return next(createError("Data is not found.", 400));
    const { startDate, endDate } = value;

    const startParts = startDate.split("-");
    const endParts = endDate.split("-");

    const start = new Date(
      Date.UTC(startParts[0], startParts[1] - 1, startParts[2], 0, 0, 0)
    );
    const end = new Date(
      Date.UTC(endParts[0], endParts[1] - 1, endParts[2], 23, 59, 59, 999)
    );

    const dataRequestcctv = await prisma.requestwatchcctv.findMany({
      where: {
        createdAt: {
          gte: start,
          lte: end,
        },
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

    // ถ้าไม่มีข้อมูล
    if (!dataRequestcctv || dataRequestcctv.length === 0) {
      return res.status(404).json({ message: "Data is not found" });
    }

    // สร้างหัวคอลัมน์
    let columnNames = Object.keys(dataRequestcctv[0]).filter(
      (col) => col !== "user"
    );
    columnNames.push("firstNameUser", "lastNameUser", "statusUser");

    const ExcelJS = require("exceljs");
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("dataRequestcctv");
    worksheet.addRow(columnNames);

    // เติมข้อมูลลงใน Excel
    dataRequestcctv.forEach((item) => {
      const row = columnNames.map((col) => {
        if (col === "createdAt") {
          return new Date(item[col])
            .toISOString()
            .replace("T", " ")
            .slice(0, 19);
        }
        if (col === "firstNameUser") return item.user?.firstName || "";
        if (col === "lastNameUser") return item.user?.lastName || "";
        if (col === "statusUser") return item.user?.status || "";
        return item[col];
      });
      worksheet.addRow(row);
    });

    // ปรับขนาดคอลัมน์
    worksheet.columns.forEach((column) => {
      column.width = 20;
    });

    // ตั้งค่า header ไฟล์ Excel
    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );
    const now = new Date();
    const timestamp =
      now.getFullYear().toString() +
      (now.getMonth() + 1).toString().padStart(2, "0") +
      now.getDate().toString().padStart(2, "0") +
      "_" +
      now.getHours().toString().padStart(2, "0") +
      now.getMinutes().toString().padStart(2, "0") +
      now.getSeconds().toString().padStart(2, "0");

    res.setHeader(
      "Content-Disposition",
      `attachment; filename=userRequestcctv_${timestamp}.xlsx`
    );

    // ส่งไฟล์ออกไป
    await workbook.xlsx.write(res);
    res.end();
  } catch (error) {
    next(error);
  }
};

exports.dataReportsosExcel = async (req, res, next) => {
  try {
    const { value, error } = date.validate(req.params);
    if (error) return next(createError("Data is not found", 400));

    const { startDate, endDate } = value;

    const startParts = startDate.split("-");
    const endParts = endDate.split("-");

    // สร้างเวลาแบบ UTC
    const start = new Date(
      Date.UTC(startParts[0], startParts[1] - 1, startParts[2], 0, 0, 0)
    );
    const end = new Date(
      Date.UTC(endParts[0], endParts[1] - 1, endParts[2], 23, 59, 59, 999)
    );

    const dataReportsos = await prisma.sosvoiceorvdo.findMany({
      where: {
        createdAt: {
          gte: start,
          lte: end,
        },
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

    if (!dataReportsos || dataReportsos.length === 0) {
      return res.status(404).json({ message: "Data is not found" });
    }

    // ✅ สร้าง column แบบกำหนดเองเพื่อความชัวร์
    const columnNames = [
      "id",
      "file",
      "status",
      "latitude",
      "longtitude", // สมมุติใช้ชื่อแบบนี้ใน DB จริง ๆ
      "createdAt",
      "updatedAt",
      "firstName",
      "lastName",
      "userStatus",
    ];

    const ExcelJS = require("exceljs");
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("dataReportsos");
    worksheet.addRow(columnNames); // ➕ Header

    dataReportsos.forEach((item) => {
      const row = columnNames.map((col) => {
        if (col === "createdAt" || col === "updatedAt") {
          return item[col]
            ? new Date(item[col]).toISOString().replace("T", " ").slice(0, 19)
            : "";
        }
        if (col === "firstName") return item.user?.firstName || "";
        if (col === "lastName") return item.user?.lastName || "";
        if (col === "userStatus") return item.user?.status || "";
        return item[col] ?? "";
      });
      worksheet.addRow(row);
    });

    worksheet.columns.forEach((col) => {
      col.width = 20;
    });

    const now = new Date();
    const timestamp =
      now.getFullYear().toString() +
      (now.getMonth() + 1).toString().padStart(2, "0") +
      now.getDate().toString().padStart(2, "0") +
      "_" +
      now.getHours().toString().padStart(2, "0") +
      now.getMinutes().toString().padStart(2, "0") +
      now.getSeconds().toString().padStart(2, "0");

    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );
    res.setHeader(
      "Content-Disposition",
      `attachment; filename=sosReports_${timestamp}.xlsx`
    );

    await workbook.xlsx.write(res);
    res.end();
  } catch (error) {
    next(error);
  }
};

exports.dataIntegratedInformationExcel = async (req, res, next) => {
  try {
    const { value, error } = date.validate(req.params);
    if (error) next(createError("Data is not found.", 400)); // พังจบบรรทัดนี้เลย ขึ้นเลข 4 พังหน้าบ้าน

    const { startDate, endDate } = value;
    const startParts = startDate.split("-");
    const endParts = endDate.split("-");

    const start = new Date(
      Date.UTC(startParts[0], startParts[1] - 1, startParts[2], 0, 0, 0)
    );
    const end = new Date(
      Date.UTC(endParts[0], endParts[1] - 1, endParts[2], 23, 59, 59, 999)
    );

    const dataIntegratedInformation =
      await prisma.integratedinformation.findMany({
        where: {
          createdAt: {
            gte: start, // วันที่เริ่ม
            lte: end, // ถึงวันสุดท้าย ขาดอีก 1 วิ เที่ยงคืน
          },
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

    if (!dataIntegratedInformation || dataIntegratedInformation.length === 0) {
      return res.status(404).json({ message: "Data is not found" });
    } // ถ้าไม่มีข้อมูล

    let columnNames = Object.keys(dataIntegratedInformation[0]).filter(
      (col) => col !== "userId" && col !== "user"
    ); // หาตัวที่ไม่ใช่ userId  user

    columnNames.push("firstName", "lastName", "status");
    // เพิ่ม คีลงไป 3 ตัว รวมเป็น
    /* 
    id
    male
    female
    household
    store
    restaurant
    place
    accommodation
    createAt
    firstName
    LastName
    status
    */

    const workbook = new ExcelJS.Workbook();
    // สร้าง Workbook หรือพูดง่าย ๆ คือไฟล์ Excel เปล่า ๆ อันหนึ่ง
    const worksheet = workbook.addWorksheet("IntegratedData");

    worksheet.addRow(columnNames);
    // แถวแรกหัวของตาราง

    dataIntegratedInformation.forEach((item) => {
      const row = columnNames.map((col) => {
        if (col === "createdAt") {
          return new Date(item[col])
            .toISOString() // 2025-03-24T14:32:01.000Z
            .replace("T", " ") // กลายเป็น "2025-03-24 14:32:01.000Z"
            .slice(0, 19); // ตัดเหลือแค่ "2025-03-24 14:32:01"
        }
        if (col === "firstName") return item.user?.firstName || "";
        if (col === "lastName") return item.user?.lastName || "";
        if (col === "status") return item.user?.status || "";
        return item[col];
      });
      worksheet.addRow(row);
    });

    worksheet.columns.forEach((column) => {
      column.width = 20;
    }); // ความกว้างของตาราง

    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );
    // ➡️ บอก browser ว่า response นี้เป็นไฟล์ Excel (.xlsx) เพื่อให้มันรู้วิธีจัดการ
    const now = new Date();
    const timestamp =
      now.getFullYear().toString() +
      (now.getMonth() + 1).toString().padStart(2, "0") +
      now.getDate().toString().padStart(2, "0") +
      "_" +
      now.getHours().toString().padStart(2, "0") +
      now.getMinutes().toString().padStart(2, "0") +
      now.getSeconds().toString().padStart(2, "0");

    res.setHeader(
      "Content-Disposition",
      `attachment; filename=IntegratedInformation_${timestamp}.xlsx`
    );

    await workbook.xlsx.write(res);
    res.end();
  } catch (error) {
    next(error);
  }
};
