-- Customer table
CREATE TABLE Customer (
    Nric VARCHAR(9) PRIMARY KEY,
    Intention VARCHAR(100),
    FOREIGN KEY (Nric) REFERENCES [User] (Nric)
);
