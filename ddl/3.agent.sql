-- Agent table
CREATE TABLE Agent (
    Nric VARCHAR(9) PRIMARY KEY,
    Licensenum VARCHAR(50) UNIQUE NOT NULL,
    Licenseexpiry DATE NOT NULL,
    FOREIGN KEY (Nric) REFERENCES [User] (Nric)
);
