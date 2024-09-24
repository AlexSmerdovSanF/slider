const functions = require("firebase-functions");
const admin = require("firebase-admin");
const https = require("https");
exports.getSMS = functions
  .runWith({
    timeoutSeconds: 60,
    memory: "512MB",
  })
  .https.onCall((data, context) => {
    return new Promise((resolve, reject) => {
      const to = data.phone;
      const text = data.code;
      const route = "fcall";
      if (!to || !text) {
        reject(
          new functions.https.HttpsError(
            "invalid-argument",
            "Missing parameters: to or text",
          ),
        );
        return;
      }
      const postData = JSON.stringify({
        route,
        to,
        text,
      });
      const options = {
        hostname: "cp.redsms.ru",
        port: 443,
        path: "/api/message",
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          login: "Efaria",
          ts: "test",
          secret: "ae76fd66bc7d36c8aec894da4f34c119",
        },
      };
      const req = https.request(options, (res) => {
        let responseBody = "";
        res.on("data", (chunk) => {
          responseBody += chunk;
        });
        res.on("end", () => {
          try {
            const responseJSON = JSON.parse(responseBody);
            if (responseJSON.status === 200) {
              resolve(responseJSON);
            } else {
              reject(
                new functions.https.HttpsError("internal", "Error sending SMS"),
              );
            }
          } catch (error) {
            reject(
              new functions.https.HttpsError(
                "internal",
                "Error processing response",
                error,
              ),
            );
          }
        });
      });
      req.on("error", (error) => {
        reject(
          new functions.https.HttpsError(
            "internal",
            "Error sending SMS",
            error,
          ),
        );
      });
      req.write(postData);
      req.end();
    });
  });
