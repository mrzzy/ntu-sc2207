-- Customer table
CREATE TABLE Customer (
    nric VARCHAR(9) PRIMARY KEY,
    intention VARCHAR(100),
    FOREIGN KEY (nric) REFERENCES [User](nric)
);
