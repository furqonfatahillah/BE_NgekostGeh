const mysql = require("mysql2/promise");

const dbPool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
});

async function query(query, values) {
  try {
    const [executeQuery] = await dbPool.query(query, values || []);
    console.log("Execute Query Result:", executeQuery);
    return executeQuery;
  } catch (error) {
    console.error("Query Execution Error:", error);
  }
}

module.exports = {
  query,
};
