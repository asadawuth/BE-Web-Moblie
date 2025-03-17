const Joi = require("joi");

const createNowDataIntegratedInformation = Joi.object({
  male: Joi.string().trim(),
  female: Joi.string().trim(),
  household: Joi.string().trim(),
  store: Joi.string().trim(),
  restaurant: Joi.string().trim(),
  place: Joi.string().trim(),
  accommodation: Joi.string().trim(),
});

exports.createNowDataIntegratedInformation = createNowDataIntegratedInformation;
