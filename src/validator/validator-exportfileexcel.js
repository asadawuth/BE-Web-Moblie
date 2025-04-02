const Joi = require("joi");

const dateRangeSchema = Joi.object({
  startDate: Joi.date().iso().required().label("วันที่เริ่มต้น"),
  endDate: Joi.date().iso().required().label("วันที่สิ้นสุด"),
});

const date = Joi.object({
  startDate: Joi.string()
    .pattern(/^\d{4}-\d{2}-\d{2}$/)
    .required(),
  endDate: Joi.string()
    .pattern(/^\d{4}-\d{2}-\d{2}$/)
    .required(),
});

exports.dateRangeSchema = dateRangeSchema;
exports.date = date;
