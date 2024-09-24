-- Agent table
CREATE TABLE Agent (
    nric VARCHAR(9) PRIMARY KEY,
    licenseNum VARCHAR(50) UNIQUE NOT NULL,
    licenseExpiry DATE NOT NULL,
    FOREIGN KEY (nric) REFERENCES [User](nric)
);