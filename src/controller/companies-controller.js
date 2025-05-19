const createError = require("../utils/create-error.js");
const prisma = require("../model/prisma.js");
const fs = require("fs");
const path = require("path");
const { valueForCompanies } = require("../validator/validator-companies.js");

exports.updatedDataInCompanies = async (req, res, next) => {
  try {
    const { key } = req.query;

    if (!key) {
      return next(createError(400, "Missing key in query"));
    }

    const checkKeyInTable = await prisma.companies.findUnique({
      where: { key },
    });

    if (!checkKeyInTable) {
      return next(createError(404, `Key "${key}" not found in companies`));
    }

    const { error, value } = valueForCompanies.validate(req.body);
    if (error) {
      return next(createError(400, "Error from input"));
    }

    let imageFiles = req.files?.images || [];

    if (!Array.isArray(imageFiles)) {
      imageFiles = [imageFiles];
    }

    const imageUrls = imageFiles.map(
      (file) => `${req.protocol}://${req.get("host")}/public/${file.filename}`
    );

    // ✅ 1. ดึงข้อมูลรูปเดิม
    const oldImage = await prisma.companies.findFirst({
      where: { key },
    });

    let oldImages = [];
    try {
      const parsedValue = JSON.parse(oldImage?.value || "{}");
      oldImages = parsedValue.images || [];
    } catch (parseError) {
      console.warn("⚠️ Failed to parse old image value:", parseError);
    }

    const combinedImages = [...oldImages, ...imageUrls];
    // ✅ 2. รวมรูปเก่า + ใหม่ แล้วจำกัดไม่เกิน 5 รูป
    if (combinedImages.length > 5) {
      return next(createError(400, "Image limit is 5 files max"));
    }
    //  ✅ 3. อัปเดตข้อมูล
    const result = await prisma.companies.update({
      where: { key },
      data: {
        value: JSON.stringify({
          text: value.text,
          images: combinedImages,
        }),
      },
    });

    res.status(200).json({
      message: "Updated successfully",
      data: result,
    });
  } catch (err) {
    console.error("❌ Update failed:", err);
    next(err);
  }
};

exports.dataForPopulation = async (req, res, next) => {
  try {
    const { key } = req.query;
    const getdata = await prisma.companies.findMany({
      where: {
        key: key,
      },
    });

    res.status(200).json(getdata);
  } catch (error) {
    next(error);
  }
};

exports.deleteImage = async (req, res, next) => {
  try {
    const { key, imageUrl } = req.query;

    if (!key || !imageUrl) {
      return next(createError(400, "Missing key or imageUrl in query"));
    }

    const rowName = await prisma.companies.findFirst({
      where: { key },
    });

    if (!rowName) {
      return next(createError(404, "Key is not found"));
    }

    let parsedValue;
    parsedValue = JSON.parse(rowName.value || "{}");

    const oldImages = parsedValue.images || [];

    // ลบเฉพาะ imageUrl ที่ส่งมา
    const updatedImages = oldImages.filter((url) => url !== imageUrl);

    // อัปเดตข้อมูล
    const result = await prisma.companies.update({
      where: { key },
      data: {
        value: JSON.stringify({
          text: parsedValue.text || "",
          images: updatedImages,
        }),
      },
    });

    res.status(200).json({
      message: "Image deleted successfully",
      data: result,
    });
  } catch (error) {
    console.error("❌ Failed to delete image:", error);
    next(error);
  }
};
