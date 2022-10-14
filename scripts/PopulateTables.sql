USE DMA-CSD-V221_10434665;

SET IDENTITY_INSERT Customer ON
GO

INSERT Customer(name, address, zip, city, phoneNo, email) VALUES ('Elmer', 'Almensstrade 2', '6900', 'Vendsyssel', '12437893', 'elmer@vendsyssel.dk')
INSERT Customer(name, address, zip, city, phoneNo, email) VALUES ('Olsen', 'Colmsvej 6', '6200', 'Bjerg', '16437393', 'olsen@bjerg.dk')
INSERT Customer(name, address, zip, city, phoneNo, email) VALUES ('Grete', 'Havngade 1', '5200', 'Havnen', '62432893', 'grete@havn.dk')
GO

SET IDENTITY_INSERT Customer OFF
GO


SET IDENTITY_INSERT Private ON
GO

INSERT Private(phoneNo, freightFee) VALUES ('12437893', 45.00)
GO

SET IDENTITY_INSERT Private OFF
GO


SET IDENTITY_INSERT Club ON
GO

INSERT Club(phoneNo, discount) VALUES ('62432893', 20.00)
GO

SET IDENTITY_INSERT Club OFF
GO
