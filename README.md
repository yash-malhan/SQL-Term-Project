# SQL-Term-Project

This repository contains coursework from the Business Data Management course in the MBAN program at Penn State Univeristy (Smeal College of Business)

- Team: All Stars

- Team Members: 
   Yash Malhan	Xi Gong	   Shadman Ashraf	     Shih-Hsun Lin

## General System and sub-system setup
- The general system of this relational database is built upon the complete business cycle of a high-end office/digital supplies reseller, Allstar. The advantage of being a reseller is that Allstar is able to engage in both B2B and B2C transactions and build a diverse client base. Allstar utilizes this database to perform billing, stocking,distributing, HR and etc functions and therefore the database has several subsystems:
   - Customer subsystem stores the unique customer id which is automatically generated when our employee adds a customer to our system or when a customer signs up online. For privacy protection, we only record customer first name and essential contact information.
   - Employee subsystem stores employees’ personal, organizational, and contact information. Allstar has a special incentive program to foster a competitive working environment in which all employees, regardless of duties and level, are encouraged to make sales and enlarge our clients network and earn commissions accordingly. Historically we have seen employees on driver/warehouse workers making huge sales.
   - Department sub-system stores each department’s information and all of its employees' unique ids. Allstar does not have traditional department names, it only has numbers because each department has a mix of all functional employees and are fully rotational.
   - Supplier sub-system records the supplier’s unique ID(not replaceable) name, and contact information. Brand associate is in charge of maintaining supplier relationships and evaluating contract renewal. Abandoned suppliers are permanently dropped from the system.
   - Warehouse subsystem records warehouse basic and geographical information. Allstars’ warehouses have been stable and do not expect expansion until a significant business scale update.
   - Product type subsystem stores the product types Allstar intends to source and sell after thorough market research and discussions by upper management.
   - Product subsystem records the unique id of each product(not replaceable), general product information, where it comes from and where it is stored. Outdated products will be permanently dropped from the system.
   - Sales channel subsystem records the channels Allstar list or distributes its products. 
   - Invoice subsystem, records unique invoice id, customer information, timestamp, relevant salesperson information  every time a sale has been made. Invoice ID start with the last two digits of the current year, and the will be zeroed at the beginning of a new fiscal year. Delivery address is not directly recorded in this subsystem due to privacy protection, and segregation of duties reasons. Instead, delivery addresses can be hashed using the combination of invoice id, city, and state as keys in a security sandbox outside Allstar’s primary system.
   - Payment subsystem records the customer id, payment method, amount, timestamp every time a payment has been made. A unique payment ID will also be automatically generated. Payment method cash records not just bills but also cash equivalents such as money order, check, anc online echeck, essentially any payment that is not on account. Allstar’s customers are mostly on payment terms/plans so payments are usually not in full amount.

## Business Rules:
- Customer-Payments: Customer table has an optional one to many relationship with the payments table. A customer may make zero multiple payments but each payment corresponds to only one customer.
- Customer-Invoice: Customer table has a one to many relationship with the invoice table. A customer may have multiple invoices under their name but each invoice corresponds to only one customer.
- Invoice-Employee: Invoice table has an optional one to many relationship with the employee table. An employee/sales representative may generate zero to multiple  invoices but each invoice corresponds to only one employee/sales representative.
- Department-Employee: Department table has a one to many relationship to the employee table. Each department may have multiple employees but one employee can only be employed in one department.
- Sales_Channel-Invoice: Sales_channel table has a one to many relationship with the invoice table. One sales channel may distribute multiple invoice/product combinations, but each invoice/product combination can only be distributed in one particular sales channel.
- Invoice-Product: Invoice table  has an optional one to many relationship with the product table. A product can be found on zero to multiple invoice/product combinations, but each invoice/product combination can only contain one product.
- Supplier-Product: Supplier table has one to many relationship with the product table. Each supplier can supply multiple products but we source each product from only one supplier.
- Product_type-Product: Product_type table has a one to many relationship with the product table. Each product type can have multiple products, but each product can only be in one particular product category.
- Warehouse-Product: Warehouse table has a one to many relationship with the product table. Each warehouse can store multiple products, but each product can only be stored in one warehouse at a time.

