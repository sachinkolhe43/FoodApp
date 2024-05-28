const express = require("express");
const db = require("../db");
const utils = require("../utils");

const router = express.Router();

//admin - get all customers
router.get("/", (request, response) => {
  const statement = `SELECT * FROM Customers`;
  db.connection.query(statement, (error, result) => {
    response.send(utils.createResult(error, result));
  });
});

//customer - customer register

router.post("/register", (request, response) => {
  const {
    customer_name,
    customer_mobile_no,
    customer_pin,
    customer_address,
    customer_email,
  } = request.body;
  db.query(
    "INSERT INTO Customers(customer_name,customer_mobile_no,	customer_pin,customer_address ,customer_email) VALUES(?,?,?,?,?)",
    [
      customer_name,
      customer_mobile_no,
      customer_pin,
      customer_address,
      customer_email,
    ],
    (error, result) => {
      response.send(utils.createResult(error, result));
    }
  );
});

//Customer - Customer login
router.post("/login", (request, response) => {
  console.log(request.body);
  const { customer_mobile_no, customer_pin } = request.body;
  const statement =
    "SELECT * FROM Customers WHERE customer_mobile_no=? and customer_pin=?";
  db.query(statement, [customer_mobile_no, customer_pin], (error, result) => {
    response.send(utils.createResult(error, result));
  });
});

//--customer - fetch perticular customer details
router.get("/:id", (request, response) => {
  const id = request.params.id;
  const statement = `SELECT * FROM Customers WHERE customer_mobile_no=?`;
  db.connection.query(statement, [id], (error, result) => {
    response.send(utils.createResult(error, result));
  });
})


module.exports = router;



