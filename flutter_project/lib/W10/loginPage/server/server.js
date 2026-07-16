const express = require("express");
const jwt = require("jsonwebtoken");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

const SECRET = "my-secret-key";

// -------------------- USERS --------------------

const users = [
  { id: 1, name: "Alice", email: "alice@mail.com", password: "Alice12@@" },
  { id: 2, name: "Bob", email: "bob@mail.com", password: "Bob12@@" },
  { id: 3, name: "Charlie", email: "charlie@mail.com", password: "Charlie12@@" },
];

// -------------------- LOGIN --------------------

app.post("/login", (req, res) => {
  const { email, password } = req.body;

  console.log("POST /login", email);

  const user = users.find(
    (u) => u.email === email && u.password === password
  );

  if (!user) {
    console.log("  -> Invalid credentials");
    return res.status(401).json({ error: "Invalid credentials" });
  }

  const token = jwt.sign(
    { id: user.id, name: user.name, role: "student" },
    SECRET,
    { expiresIn: "1h" }
  );

  console.log("  -> JWT created for", user.name);

  res.json({ token });
});

// ---------------- PROTECTED API ----------------

app.get("/scores", (req, res) => {
  console.log("GET /scores");

  const auth = req.headers.authorization;

  if (!auth) {
    console.log("  -> No Authorization header");
    return res.status(401).json({ error: "No token" });
  }

  const token = auth.split(" ")[1];

  try {
    const user = jwt.verify(token, SECRET);

    console.log("  -> Token OK for", user.name);

    res.json([
      { title: "Math", value: 85 },
      { title: "Physics", value: 90 },
      { title: "English", value: 78 },
    ]);
  } catch (err) {
    console.log("  -> Invalid token");
    res.status(401).json({ error: "Invalid token" });
  }
});

app.listen(3000, () =>
  console.log("Server running on http://localhost:3000")
);