const express = require("express");
const cors = require("cors");

const routerCustomer = require("./router/customer");
// const routerProduct = require("./router/product");
// const routerCategory = require("./router/category");
// const routerCart = require("./router/cart");
// const routerOrder = require("./router/order");

const app = express();

app.use(express.json());
app.use(cors());

app.use("/customer", routerCustomer);
// app.use("/product", routerProduct);
// app.use("/category", routerCategory);
// app.use("/cart", routerCart);
// app.use("/order", routerOrder);

app.listen(4200, "0.0.0.0", () => {
  console.log("Server started at port 4000");
});
 