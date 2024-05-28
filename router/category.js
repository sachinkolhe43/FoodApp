const express = require("express");
const db = require("../db");
const utils = require("../utils");

const router = express.Router();

// get all categories
router.get("/", (request, response) => {
  const statement = `SELECT * FROM Category`;
  db.connection.query(statement, (error, result) => {
    response.send(utils.createResult(error, result));
  });
});

// Fetch products by category ID
router.get("/category/:id/products", (request, response) => {
  const categoryId = request.params.id;
  const statement = `SELECT * FROM Products WHERE product_category_id = ?`;

  db.query(statement, [categoryId], (error, result) => {
    response.send(utils.createResult(error, result));
  });
});

module.exports = router;
