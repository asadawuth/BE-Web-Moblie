const Joi = require("joi");

exports.valueForCompanies = Joi.object({
  text: Joi.string().required(),
}).unknown();
