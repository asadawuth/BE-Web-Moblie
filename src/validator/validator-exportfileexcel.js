const Joi = require("joi");

const dateRangeSchema = Joi.object({
  startDate: Joi.date().iso().required().label("วันที่เริ่มต้น"),
  endDate: Joi.date().iso().required().label("วันที่สิ้นสุด"),
});

exports.dateRangeSchema = dateRangeSchema;
