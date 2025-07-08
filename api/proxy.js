export default async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  try {
    const response = await fetch("https://您的ngrok地址.ngrok-free.app/ask", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(req.body)
    });
    res.status(200).json(await response.json());
  } catch (error) {
    res.status(500).json({ error: "代理请求失败" });
  }
};
