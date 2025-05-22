const WebSocket = require("ws");
const mqtt = require("mqtt");
const url = require("url");
exports.getValueHardware = async (req, res) => {
  const wss = new WebSocket.Server({ port: 5001 });
  const mqttClient = mqtt.connect("mqtt://103.245.167.111:1883");

  //const topic = "id-002/tx";

  const clientTopics = new Map();

  mqttClient.on("connect", () => {
    console.log("✅ MQTT connected");
  });

  mqttClient.on("message", (topic, message) => {
    const msg = message.toString();
    wss.clients.forEach((ws) => {
      if (ws.readyState === WebSocket.OPEN && clientTopics.get(ws) === topic) {
        ws.send(msg);
      }
    });
  });

  wss.on("connection", (ws, req) => {
    const params = new URLSearchParams(url.parse(req.url).query);
    const topic = params.get("topic");

    if (topic) {
      clientTopics.set(ws, topic);
      mqttClient.subscribe(topic, (err) => {
        if (err) {
          console.error("❌ Subscribe failed:", topic);
        } else {
          console.log(`📡 Subscribed to ${topic}`);
        }
      });
    }

    ws.on("close", () => {
      clientTopics.delete(ws);
    });
  });
};
