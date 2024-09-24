const admin = require("firebase-admin/app");
admin.initializeApp();

const getSMS = require("./get_s_m_s.js");
exports.getSMS = getSMS.getSMS;
const sendSms = require("./send_sms.js");
exports.sendSms = sendSms.sendSms;
