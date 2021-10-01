CREATE Database bagshop;

use bagshop;

CREATE TABLE BagType
  (
    bagTypeId   INTEGER NOT NULL ,
    bagTypeName VARCHAR (30) NOT NULL
  ) ;
ALTER TABLE BagType ADD CONSTRAINT BagType_PK PRIMARY KEY ( bagTypeId ) ;


CREATE TABLE Color
  (
    colorId   INTEGER NOT NULL ,
    colorName VARCHAR (30) NOT NULL
  ) ;
ALTER TABLE Color ADD CONSTRAINT Color_PK PRIMARY KEY ( colorId ) ;


CREATE TABLE Customer
  (
    username  VARCHAR (30) NOT NULL ,
    password  CHAR (100) NOT NULL ,
    firstName VARCHAR (50) NOT NULL ,
    lastName  VARCHAR (30) NOT NULL
  ) ;
ALTER TABLE Customer ADD CONSTRAINT Customer_PK PRIMARY KEY ( username ) ;


CREATE TABLE OrderDetail
  (
    orderDetailId INTEGER NOT NULL AUTO_INCREMENT,
    productId     INTEGER NOT NULL ,
    colorId       INTEGER NOT NULL ,
    orderId       INTEGER NOT NULL ,
    PRIMARY KEY (orderDetailId)
  ) ;

CREATE TABLE Orders
  (
    orderId      INTEGER NOT NULL  AUTO_INCREMENT,
    quantity     INTEGER NOT NULL ,
    total        DECIMAL (5,2) NOT NULL ,
    deliveryDate DATE NOT NULL ,
    address      VARCHAR (400) NOT NULL ,
    username     VARCHAR (30) NOT NULL ,
    PRIMARY KEY (orderId)
  ) ;

CREATE TABLE Product
  (
    productId      INTEGER NOT NULL AUTO_INCREMENT ,
    productName    VARCHAR (30) NOT NULL ,
    productDes VARCHAR (700) NOT NULL ,
    price          DECIMAL (5,2) NOT NULL ,
    imageName      VARCHAR (50) NOT NULL ,
    bagTypeId      INTEGER NOT NULL ,
    PRIMARY KEY (productId)
  ) ;
ALTER TABLE Product ADD CONSTRAINT Product__UN UNIQUE ( productName ) ;


CREATE TABLE ProductDetail
  (
    colorId   INTEGER NOT NULL ,
    productId INTEGER NOT NULL
  ) ;
ALTER TABLE ProductDetail ADD CONSTRAINT ProductDetail_PK PRIMARY KEY ( colorId, productId ) ;


CREATE TABLE Worker
  (
    username  VARCHAR (30) NOT NULL ,
    password  CHAR (100) NOT NULL ,
    firstName VARCHAR (30) NOT NULL ,
    lastName  VARCHAR (30) NOT NULL ,
    DOB  DATE NOT NULL ,
    position VARCHAR (30) NOT NULL
  ) ;
ALTER TABLE Worker ADD CONSTRAINT Worker_PK PRIMARY KEY ( username ) ;


ALTER TABLE ProductDetail ADD CONSTRAINT FK_ASS_1 FOREIGN KEY ( colorId ) REFERENCES Color ( colorId ) ;

ALTER TABLE ProductDetail ADD CONSTRAINT FK_ASS_8 FOREIGN KEY ( productId ) REFERENCES Product ( productId ) ;

ALTER TABLE OrderDetail ADD CONSTRAINT OrderDetail_Color_FK FOREIGN KEY ( colorId ) REFERENCES Color ( colorId ) ;

ALTER TABLE OrderDetail ADD CONSTRAINT OrderDetail_Order_FK FOREIGN KEY ( orderId ) REFERENCES Orders ( orderId ) ;

ALTER TABLE OrderDetail ADD CONSTRAINT OrderDetail_Product_FK FOREIGN KEY ( productId ) REFERENCES Product ( productId ) ;

ALTER TABLE Orders ADD CONSTRAINT Order_Customer_FK FOREIGN KEY ( username ) REFERENCES Customer ( username ) ;

ALTER TABLE Product ADD CONSTRAINT Product_BagType_FK FOREIGN KEY ( bagTypeId ) REFERENCES BagType ( bagTypeId ) ;

INSERT INTO `Color` (`ColorID`, `ColorName`) VALUES ('1', '#242423'), ('2', '#BF8B3F'), ('3', '#7F8164'), ('4', '#FFBFCB'), ('5', '#ABC3C7'), ('6', '#FFF3E4'), ('7', '#D18E64'), ('8', '#F9E37C'), ('9', '#E7DCD5'), ('10', '#FEA46D');

INSERT INTO `BagType` (`BagTypeID`, `BagTypeName`) VALUES ('1', 'Mini Flap Bag'), ('2', 'The Fae Bag'), ('3', 'Gabbi Bag'), ('4', 'Rantan Bag'), ('5', 'Envelope Bag'), ('6', 'Eva Shoulder Bag'), ('7', 'Maze Bag'), ('8', 'Mila Shoulder Bag'), ('9', 'Quinn Phone Bag'), ('10', 'Cloud Top Bag');

INSERT INTO `Product` (`ProductName`, `ProductDes`, `Price`, `ImageName`, `BagTypeID`) VALUES ('Mini Flap Bag - Croc', 'Canvas & Ultra-Microfiber Vegan Leather 100% Recycled Plastic Lining 7.9\'\' W × 6.1\'\' D × 3.1\'\' H (20cm x 15.5cm x 8cm) 16.9\'\'（43cm）Handle Drop Detachable Strap (Unadjustable) Gold Hardware Push-Lock Closure 2 Interior Pockets 1 Zipping Pocket Imported', '102.02', 'MFB-Croc.jpg', '1'), ('Mini Flap Bag - Lizard', 'Lizard-Embossed  Vegan Leather 100% Recycled Plastic Lining 7.9\'\' W × 6.1\'\' D × 3.1\'\' H (20cm x 15.5cm x 8cm) 16.9\'\'（43cm）Handle Drop Detachable Strap (Unadjustable) Gold Hardware Push-Lock Closure 2 Interior Pockets 1 Zipping Pocket Imported', '102.02', 'MFB-Lizard.jpg', '1'), ('The Fae Bag - Croc', 'Croc-Embossed Vegan Leather Smooth Vegan Leather 7.4\'\' W × 6.9\'\' H × 3.1\'\' D (18.8cm x 17.5cm x 8cm) 17.3\'\'  (44 cm) Shoulder Strap Drop 3.5\'\' (9cm)  Handle Drop Detachable Strap (Unadjustable) Gold Hardware Magnetic Snap Closure 1 Interior Pocket 1 Zipping Pocket Imported', '79.72', 'TFB-Croc.jpg', '2'), ('Gabbi Bag', 'Vintage Hobo Vegan Leather Faux Suede Lining 10.2\'\' W × 2.4\'\' D × 5.1\'\' H (26cm x 6cm x 13cm) 6.7\"(17cm) Handle Drop Magnetic Closure Undetachable Strap (Unadjustable) 1 Interior Pocket Fits All Sizes Of Phones Imported', '79.72', 'GB.jpg', '3'), ('Rantan Bag', 'Croc-Embossed Vegan Leather Faux Suede Lining & Ultra-Microfiber Vegan Lining 8.7″W × 6.7″D× 8.7\"H (22cm x 17cm x 22cm) 9.5\"~ 11\"(24~28cm) Handle Drop Detachable Strap (Adjustable) Gold Hardware Zip Closure 1 Interior Pocket Imported', '95.67', 'RB.jpg', '4'), ('Envelope Bag', 'Smooth Vegan Leather Unlined Lining 8.9\"W x 6.1\"H x 2.4\" D (22.5cm x 15.5cm x 6cm) 11.8\"-20.5\'\' (30cm - 52cm) Shoulder Strap Drop Undetachable Strap (Adjustbale) Gold Hardware Magnetic Snap Closure 1 Interior Pocket. Fits All Sizes Of Phones\r\n1 Exterior Pocket 1 Zipping Slip Pocket Imported\r\n', '98.55', 'EB.jpg', '5'), ('Envelope Bag - Croc', 'Smooth Vegan Leather Unlined Lining 8.9\"W x 6.1\"H x 2.4\" D (22.5cm x 15.5cm x 6cm) 11.8\"-20.5\'\' (30cm - 52cm) Shoulder Strap Drop Undetachable Strap (Adjustbale) Gold Hardware Magnetic Snap Closure 1 Interior Pocket. Fits All Sizes Of Phones\r\n1 Exterior Pocket 1 Zipping Slip Pocket Imported\r\n', '98.55', 'EB-Croc.jpg', '5'), ('Eva Shoulder Bag - Croc', '90s Classic Baguette Bag Type Croc-Embossed Vegan Leather 100% Recycled Plastic Lining 11.02\'\' W × 5.51\'\' D × 1.77\'\' H (28cm x 14cm x 4.5cm) 7.87\'\' (20cm) Handle Drop Undetachable Strap (Unadjustable) Silver Hardware Zip Closure Fits All Sizes Of Phones Imported', '79.72', 'ESB-Croc.jpg', '6'), ('Maze Bag', 'Major Material: Vegan Leather Dimensions: 9\"W × 5.9\"H × 3.9\"D (23cm x 15cm x 10cm) Shoulder Strap Drop: 17.7\'\' - 22\'\'(45cm - 56cm) Silver Hardware 1 interior zip pocket and 1 interior slit pocket Fits for iPhone12 Pro Max and all sizes Of Phones which are smaller than it Imported', '89.29', 'MB.jpg', '7'), ( 'Mila Shoulder Bag', 'Vegan Leather Twill cotton lining 9.4\'\' W × 2.4\'\' D × 5.3\'\' H (24cm x 6cm x 13.5cm) 9.8\"(25cm) Shoulder Strap Drop Detachable Strap (Unadjustable) 1 Interior Pocket Gold Hardware Fits All Sizes Of Phones Imported', '79.99', 'MSB.jpg', '8'), ('Quinn Phone Bag', 'Major Material: Croc-Embossed Vegan leather Dimensions: 4.1’’W × 7.5”H × 0.8″D (10.3cm x 19cm x 2cm) Fits for all phones smaller than iPhone Pro Max (Screen Size - 6.7\", without phone case)', '60.77', 'QPB.jpg', '9'), ('Cloud Top Bag', 'Vintage Vegan Leather Faux Suede Lining 12\'\' W × 3.5\'\' D × 5.5\'\' H (30.5cm x 9cm x 14cm) 3.5\"(9cm) Handle Drop Magnetic Closure Gold Hardware Detachable Strap (Unadjustable) 1 Interior Pocket Fits All Sizes Of Phones Imported', '76.77', 'CTB.jpg', '10');


INSERT INTO `ProductDetail` (`ColorID`, `ProductID`) VALUES ('1', '1'), ('7', '1'), ('6', '2'), ('9', '2'), ('3', '3'), ('5', '3'), ('6', '3'), ('1', '4'), ('2', '4'), ('7', '4'), ('4', '5'), ('6', '5'), ('7', '5'), ('1', '6'), ('9', '6'), ('3', '7'), ('5', '7'), ('6', '7'), ('6', '8'), ('8', '8'), ('1', '9'), ('3', '9'), ('5', '9'), ('4', '10'), ('8', '10'), ('5', '11'), ('6', '11'), ('8', '11'), ('7', '12'), ('10', '12');

INSERT INTO `Customer` (`username`, `password`, `firstName`, `lastName`) VALUES ('girldaisy', '$2b$10$5uQvS6LVGf/spYcR4uJOKOQZ1oVu4rXt9ImrW4jTDwDx0wWe5aoXq', 'Daisy', 'Wilson'), ('andrt', '$2b$10$OVU5us.aig04kXswvRELfu8scvbCpOqTc9m2TLnuZM82P5F4KWgUa', 'Andrea', 'Thomson'), ('mastew', '$2b$10$zSuNPauUHK.aNoMHHSDnuu86symse/dSVYsV.h2xtM316Ftm/zvFG', 'Maisie', 'Stewart'), ('summerrob', '$2b$10$3zjvgXvOsLM16w9qCgVm/.Yk9hHJWVrNG5P4UCF/7kTmzzVjv6Y/O', 'Summer', 'Robinson'), ('ruberry', '$2b$10$L6dMT5tF1riz5MCQCR1Om.5J8maRPupiEB6aUPG85FMB2OMRoVeYG', 'Ruby', 'Perry'), ('bryantson', '$2b$10$UBYM7JGvW46nbyF7Ean2eORkD72T4n7TylpOlBK3LhrLIPSorfvQi', 'Bryant', 'Nelson'), ('kellycolt', '$2b$10$CQFtEMywzJN6F6EwHBq3BOveK4MfKq5xUx514uOMeL5BsTHgSW5Cm', 'Colt', 'Kelly'), ('lucylu', '$2b$10$jxI5/0KqydUjtQnT8vckXOPN3G6wigOVywZ3ZXkI7TOlWo1mNm/m6', 'Lucy', 'Harris'), ('marphoebe', '$2b$10$dCXoV8iKnJvWoQ.wHZdDIOj83Fq1kuZXiZmaE/76iNbAcoRG8Az/S', 'Phoebe', 'Martin'), ('sarahwat', '$2b$10$KAqYkhHDTmge5wwKeKoM9.yaNXDlu8zGe7uSKA5ZbVSnv1tgyIWUO', 'Sarah', 'Watson');

INSERT INTO `Orders` (`quantity`, `total`, `deliveryDate`, `address`, `username`) VALUES ('2', '162.79', '2021-10-16', '115 1/2 IVINSON ST, LARAMIE, WY 82070-3002 USA', 'girldaisy'), ('1', '98.5', '2021-10-16', '1400 PATRIOT BLVD, GLENVIEW, IL 60025-0015 USA', 'andrt'), ('1', '102.02', '2021-10-17', '34 HC 54, KIMBALL, CO 69145-9603 USA', 'mastew'), ('1', '98.55', '2021-10-17', '134 RR 1, MOUNT STERLING, MO 52573-9503 USA', 'summerrob'), ('2', '172.44', '2021-10-19', '18 MAIN ST, NEWARK, DE 19716-0008 USA', 'ruberry'), ('1', '79.72', '2021-10-21', '1016 STATE ROUTE 257, DELAWARE, OH 43015-0020 USA', 'bryantson'), ('1', '102.02', '2021-10-21', '106 DAHLIN AVE, ISANTI, MN 55040-1300 USA', 'kellycolt'), ('1', '79.99', '2021-10-23', '480 MAPLE ST, MARINE ON SAINT CROIX, MN 55047-4400 USA', 'lucylu'), ('3', '229.78', '2021-10-25', '26045 MARKET PLACE BLVD, ELKO NEW MARKET, MN 55020-5000 USA ', 'marphoebe'), ('1', '79.72', '2021-10-26', '282 THE GRN, NEWARK, DE 19716-0009 USA', 'sarahwat');

INSERT INTO `OrderDetail` (`orderDetailId`, `productId`, `colorId`, `orderId`) VALUES (NULL, '2', '6', '1'), (NULL, '11', '8', '1'), (NULL, '6', '1', '2'), (NULL, '2', '9', '3'), (NULL, '7', '6', '4'), (NULL, '5', '7', '5'), (NULL, '12', '10', '5'), (NULL, '8', '8', '6'), (NULL, '1', '7', '7'), (NULL, '10', '4', '8'), (NULL, '3', '5', '9'), (NULL, '9', '1', '9'), (NULL, '11', '6', '9'), (NULL, '4', '7', '10');

INSERT INTO `Worker` (`username`, `password`, `firstName`, `lastName`, `DOB`, `position`) VALUES ('AthenaSmith', '$2b$10$tZoB3wUkto/nKMr0HQHcAOEl5XvLovyZTnIptq/SLfbEBEAHmu2s6', 'Athena', 'Smith', '1990-01-05', 'Admin'), ('CaraJohnson', '$2b$10$3NLmw62ADXKF74Vl4e0lu.e7RA1lUXaBaFH8VUyOupiUZNcY9yLqu', 'Cara', 'Johnson', '1995-12-30', 'Staff'), ('AddisonWilliams', '$2b$10$hwD1Z31D1EtlzzIrVmSIG.yB7kb0zchMj2RtUMQwLEw3GiD..dx26', 'Addison', 'Williams', '1997-10-03', 'Staff'), ('KateJensen', '$2b$10$vlOFZWIKnCD5MrwHo3k39eV6iMzWuhseBLDHFonnjVClYOJYmg5IW', 'Kate', 'Jensen', '1995-06-26', 'Staff'), ('LeoBrown', '$2b$10$tc5vM9kWynSfP7CuMginV.DVILhEHrrSbZUqiH0wJS4KJWwYa5dS2', 'Leo', 'Brown', '1997-12-05', 'Staff'), ('WallerHansen', '$2b$10$rM2rKumh0AlPov19piKCSugHVdObUufElVlQZaEHn6mV2BA464hN2', 'Waller', 'Hansen', '1997-08-04', 'Staff'), ('AnnaJones', '$2b$10$zlA3Z7rZk/.NPpqmqta1YOdzRl6YvpY.gMqH52fJ3.21wJls1Sn92', 'Anna', 'Jones', '1996-02-23', 'Staff'), ('JolieTaylor', '$2b$10$dG3qPfrLrJpggnVYGkj8OOljD2FuxNv7osoFOQq9hY3myBc46nSbK', 'Jolie', 'Taylor', '1995-06-05', 'Staff'), ('OpalPedersen', '$2b$10$XYVFVz8A4kUunkHJVflch.veZ6Ju8KV3O5wXlugn7peZU4aDLNGmW', 'Opal', 'Pedersen', '1995-06-05', 'Staff'), ('PiperAndersen', '$2b$10$IGQnFLJFiZIARHREjlsfWuZdFcOhPxHg7LumfgIqp1Ff5FB7SEar.', 'Piper', 'Andersen', '1995-04-17', 'Staff');
Drop user if exists 'backend'@'%';

create user 'backend'@'%' identified by 'Int222039098103';
grant select, insert, update, delete on Product to 'backend'@'%';
grant select, insert, update, delete on ProductDetail to 'backend'@'%';
grant select, insert, update, delete on Orders to 'backend'@'%';
grant select, insert, update, delete on OrderDetail to 'backend'@'%';
grant select, insert, update, delete on Worker to 'backend'@'%';
grant select, insert, update, delete on Customer to 'backend'@'%';
grant select on Color to 'backend'@'%';
grant select on BagType to 'backend'@'%';