const express = require("express");
const cors = require("cors");

const routerCustomer = require("./router/customer");
const routerCategory = require("./router/category");
// const routerProduct = require("./router/product");
// const routerCart = require("./router/cart");
// const routerOrder = require("./router/order");

const app = express();

app.use(express.json());
app.use(cors());

app.use("/customer", routerCustomer);
app.use("/category", routerCategory);
// app.use("/product", routerProduct);
// app.use("/cart", routerCart);
// app.use("/order", routerOrder);

let port = 4400
app.listen(port, "0.0.0.0", () => {
  console.log(`Server started at port ${port}`);
});
 