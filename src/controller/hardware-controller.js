const WebSocket = require("ws");
const mqtt = require("mqtt");

exports.getValueHardware = async (req, res) => {
  const wss = new WebSocket.Server({ port: 5001 });
  const mqttClient = mqtt.connect("mqtt://103.245.167.111:1883");

  const topic = "id-002/tx";

  mqttClient.on("connect", () => {
    console.log("✅ MQTT connected on port 1883");
    mqttClient.subscribe(topic);
  });

  mqttClient.on("message", (topic, message) => {
    wss.clients.forEach((ws) => {
      if (ws.readyState === WebSocket.OPEN) {
        ws.send(message.toString());
      }
    });
  });

  wss.on("connection", (ws) => {
    console.log("🌐 React client connected");
  });
};
