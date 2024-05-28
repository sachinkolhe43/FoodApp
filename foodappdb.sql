-- drop database FoodApp
create database FoodApp;
use FoodApp;

CREATE TABLE Customers (
    customer_name        VARCHAR(120) NOT NULL,
    customer_mobile_no   VARCHAR(15) PRIMARY KEY,
    customer_pin         INT NOT NULL,
    customer_address     VARCHAR(255) NOT NULL,
    customer_email       VARCHAR(120) NOT NULL UNIQUE
);

INSERT INTO Customers (customer_name, customer_mobile_no, customer_pin, customer_address, customer_email)
VALUES
('Snehadeep Chougule', '7276503051', 1234, 'Chintamani Nagar,Sangli', 'snehadeepchougule2509@gmail.com'),
('Sachin Kolhe', '9730654183', 1234, 'Aambrai', 'sachin@gamil.com'),
('xyz', '5555555555', 5555, 'College Corner,Sangli', 'xyz@gmail.com');


CREATE TABLE Category (
    product_category_id  INT PRIMARY KEY AUTO_INCREMENT,
    category_name        VARCHAR(120) NOT NULL
);

INSERT INTO Category (category_name)
VALUES
('Pizza'),
('Burger'),
('Pasta');


CREATE TABLE Products (
    product_id           INT PRIMARY KEY AUTO_INCREMENT,
    product_category_id  INT,
    product_name         VARCHAR(120) NOT NULL,
    product_description  VARCHAR(255),
    product_image        VARCHAR(120),
    FOREIGN KEY (product_category_id) REFERENCES Category(product_category_id)
);

INSERT INTO Products (product_category_id, product_name, product_description, product_image)
VALUES
(1, 'Panner Pizza', 'Rich on panner Tasty pizza', 'PannerPizza.jpg'),
(1, 'Vegitables Pizza', 'Mixture of fresh vaggies', 'VegitablesPizza.jpg'),
(2, 'Cheese Burger', 'Loaded with Cheese', 'CheeseBurger.jpg'),
(3, 'Bow Tie Pasta', 'Resembles a small bow tie with a frilled edge', 'BowTiePasta.jpg');

CREATE TABLE ProductPricings (
    product_pricing_id           INT PRIMARY KEY AUTO_INCREMENT,
    product_small_price          DECIMAL(10, 2),
    product_large_price          DECIMAL(10, 2),
    product_sauce_price          DECIMAL(10, 2),
    product_mayonnaise_price     DECIMAL(10, 2),
    product_discount_price       DECIMAL(10, 2),
    product_id                   INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO ProductPricings (product_small_price, product_large_price, product_sauce_price, product_mayonnaise_price, product_discount_price, product_id)
VALUES
(599.99, 849.99, 20, 40, 129.00, 1),
(999.99, 1299.99, 20, 40, 129.00, 2),
(299.00, 350.00, 20, 40, 129.00, 3),
(399.00, 450.00 , 20, 40, 129.00, 4);


CREATE TABLE Carts (
    cart_id                      INT PRIMARY KEY AUTO_INCREMENT,
    customer_mobile_no           VARCHAR(15),
    product_id                   INT,
    product_quantity             INT,
    FOREIGN KEY (customer_mobile_no) REFERENCES Customers(customer_mobile_no),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Carts (customer_mobile_no, product_id, product_quantity)
VALUES
('7276503051', 1, 1),
('9730654183', 2, 1),
('5555555555', 3, 2);

CREATE TABLE Orders (
    order_id                     INT PRIMARY KEY AUTO_INCREMENT,
    customer_mobile_no           VARCHAR(15),
    product_id                   INT,
    product_quantity             INT,
    order_date_time              TIMESTAMP,
    total_order_price            DECIMAL(10, 2),
    FOREIGN KEY (customer_mobile_no) REFERENCES Customers(customer_mobile_no),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Orders (customer_mobile_no, product_id, product_quantity, order_date_time, total_order_price)
VALUES
('7276503051', 1, 1, '2024-05-26 14:30:00', 659.99),
('9730654183', 2, 1, '2024-05-26 15:00:00', 999.99),
('5555555555', 3, 2, '2024-05-26 16:00:00', 339.00);
