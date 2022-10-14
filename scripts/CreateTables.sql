USE DMA-CSD-V221_10434665;

/* Create Customer tables */
/* Create Customer */
CREATE TABLE Customer(
    name nvarchar(50) NOT NULL,
    address nvarchar(100) NOT NULL,
    zip nvarchar(30) NOT NULL,
    city nvarchar(50) NOT NULL,
    phoneNo nvarchar (20) NOT NULL,
    email nvarchar(150) NOT NULL,
    CONSTRAINT PK_Customer PRIMARY KEY (phoneNo)
)

/* Create Private with FK to Customer */
CREATE TABLE Private(
    phoneNo nvarchar(20) NOT NULL,
    freightFee float NOT NULL,
    CONSTRAINT PK_Private PRIMARY KEY (phoneNo),
    CONSTRAINT FK_Private FOREIGN KEY(phoneNo) REFERENCES Customer(phoneNo)
)

/* Create Club with FK to Customer */
CREATE TABLE Club(
    phoneNo nvarchar(20) NOT NULL,
    discount float NOT NULL,
    CONSTRAINT PK_Private PRIMARY KEY (phoneNo),
    CONSTRAINT FK_Private FOREIGN KEY(phoneNo) REFERENCES Customer(phoneNo)
)

/* Create Product tables */
/* Create GunReplica */
CREATE TABLE GunReplica(
    gunId int NOT NULL,
    calibre nvarchar(20) NOT NULL,
    material nvarchar(100) NOT NULL,
    CONSTRAINT PK_GunReplica PRIMARY KEY (gunId)
)

/* Create Clothing */
CREATE TABLE Clothing(
    clothId int NOT NULL,
    size nvarchar(20) NOT NULL,
    colour nvarchar(100) NOT NULL,
    CONSTRAINT PK_Clothing PRIMARY KEY (clothId)
)

/* Create Equipment */
CREATE TABLE Equipment(
    equipId int NOT NULL,
    type nvarchar(20) NOT NULL,
    description nvarchar(100) NOT NULL,
    CONSTRAINT PK_Equipment PRIMARY KEY (equipId)
)

/* Create itemIdTable with FK's to items */
CREATE TABLE ItemIdTable(
    tableId int NOT NULL,
    gunId int NULL,
    clothId int NULL,
    equipId int NULL,
    CONSTRAINT PK_ItemIdTable PRIMARY KEY (tableId),
    CONSTRAINT FK_GunReplica FOREIGN KEY (gunId) REFERENCES GunReplica(gunId),
    CONSTRAINT FK_Clothing FOREIGN KEY (clothId) REFERENCES GunReplica(clothId),
    CONSTRAINT FK_Equipment FOREIGN KEY (equipId) REFERENCES GunReplica(equipId)
)

/* Create Warehouse*/
CREATE TABLE Warehouse(
    warehouseId int NOT NULL,
    stock int NOT NULL,
    shelf nvarchar(30) NOT NULL,
    tableId int NOT NULL,
    CONSTRAINT PK_Warehouse PRIMARY KEY (warehouseId),
    CONSTRAINT FK_Warehouse_ItemIdTable FOREIGN KEY (tableId) REFERENCES itemIdTable(tableId)
)

/* Create Product */
CREATE TABLE Product(
    productId int NOT NULL,
    name nvarchar(50) NOT NULL,
    purchasePrice float NOT NULL,
    salesPrice float NOT NULL,
    rentPrice float NOT NULL,
    countryOfOrigin nvarchar(20) NOT NULL,
    minStock int NOT NULL,
    tableId int NOT NULL,
    CONSTRAINT PK_Product PRIMARY KEY (productId),
    CONSTRAINT FK_Product_ItemIdTable FOREIGN KEY (tableId) REFERENCES ItemIdTable(tableId)
)

/* Create Supplier */
CREATE TABLE Supplier(
    name nvarchar(20) NOT NULL,
    address nvarchar(100) NOT NULL,
    country nvarchar(20) NOT NULL,
    phoneNo nvarchar(20) NOT NULL,
    email nvarchar(150) NOT NULL,
    productId int NOT NULL,
    CONSTRAINT PK_Supplier PRIMARY KEY (phoneNo),
    CONSTRAINT FK_Sipplier_Product FOREIGN KEY (productId) REFERENCES Product(productId)
)

/* Create Order tables */
/* Create Invoice */
CREATE TABLE Invoice(
    invoiceNo int NOT NULL,
    paymentDate datetime NOT NULL,
    amount int NOT NULL,
    CONSTRAINT PK_Invoice PRIMARY KEY (invoiceNo)
)

/* Create SaleOrder */
CREATE TABLE SaleOrder(
    saleId int NOT NULL,
    phoneNo nvarchar(20) NOT NULL,
    date datetime NOT NULL,
    deliveryStatus nvarchar(20) NOT NULL,
    deliveryDate datetime not NULL,
    invoiceNo int NOT NULL,
    CONSTRAINT PK_SaleOrder PRIMARY KEY (saleId),
    CONSTRAINT FK_SaleOrder_Customer FOREIGN KEY (phoneNo) REFERENCES Customer(phoneNo),
    CONSTRAINT FK_SaleOrder_Invoice FOREIGN KEY (invoiceNo) REFERENCES Invoice(invoiceNo)
)

/* SubSaleOrder */
CREATE TABLE SubSaleOrder(
    saleId int NOT NULL,
    amount int NOT NULL,
    productId int NOT NULL,
    CONSTRAINT PK_SubSaleOrder PRIMARY KEY (productId),
    CONSTRAINT FK_SubSaleOrder_SaleOrder FOREIGN KEY (saleId) REFERENCES SaleOrder(saleId),
    CONSTRAINT FK_SubSaleOrder_Product FOREIGN KEY (productId) REFERENCES Product(productId)
)