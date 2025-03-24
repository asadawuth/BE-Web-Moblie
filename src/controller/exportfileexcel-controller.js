const prisma = require("../model/prisma.js");
const ExcelJS = require("exceljs");
const {
  dateRangeSchema,
} = require("../validator/validator-exportfileexcel.js");
const createError = require("../middleware/error.js");

exports.dataReportExcel = async (req, res, next) => {
  try {
    // ✅ Validate params
    const { value, error } = dateRangeSchema.validate(req.params);
    if (error) {
      return next(createError("Data is not found.", 400));
    }

    const { startDate, endDate } = value;

    // ✅ Query จาก Prisma
    const dataIntegratedInformation =
      await prisma.integratedinformation.findMany({
        where: {
          createdAt: {
            gte: new Date(startDate),
            lte: new Date(endDate),
          },
        },
        orderBy: {
          createdAt: "asc",
        },
        include: {
          user: {
            firstName: true,
            lastName: true,
            status: true,
          },
        },
      });

    if (!dataIntegratedInformation) {
      return next(createError("Data is not found.", 404));
    }

    res.status(200).json({ dataIntegratedInformation });
  } catch (error) {
    next(error);
  }
};

exports.dataShopExcel = async (req, res, next) => {
  try {
  } catch (error) {
    next(error);
  }
};

exports.dataReuestcctvExcel = async (req, res, next) => {
  try {
  } catch (error) {
    next(error);
  }
};

exports.dataReportsosExcel = async (req, res, next) => {
  try {
  } catch (error) {
    next(error);
  }
};

exports.dataIntegratedInformationExcel = async (req, res, next) => {
  try {
    const { value, error } = dateRangeSchema.validate(req.params);
    if (error) return next(createError("Data is not found.", 400));

    const { startDate, endDate } = value;
    const end = new Date(endDate);
    end.setHours(23, 59, 59, 999);

    const dataIntegratedInformation =
      await prisma.integratedinformation.findMany({
        where: {
          createdAt: {
            gte: new Date(startDate),
            lte: end,
          },
        },
        orderBy: {
          createdAt: "asc",
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
      return next(createError("Data is not found.", 404));
    }

    let columnNames = Object.keys(dataIntegratedInformation[0]).filter(
      (col) => col !== "userId" && col !== "user"
    );

    columnNames.push("firstName", "lastName", "status");

    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("Integrated Data");

    worksheet.addRow(columnNames);

    dataIntegratedInformation.forEach((item) => {
      const row = columnNames.map((col) => {
        if (col === "createdAt") {
          return new Date(item[col])
            .toISOString()
            .replace("T", " ")
            .slice(0, 19);
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
    });

    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    );
    res.setHeader(
      "Content-Disposition",
      "attachment; filename=IntegratedInformation.xlsx"
    );

    await workbook.xlsx.write(res);
    res.end();
  } catch (error) {
    next(error);
  }
};
