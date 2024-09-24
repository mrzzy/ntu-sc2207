-- PropertyOwner table
CREATE TABLE PropertyOwner (
    nric VARCHAR(9) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contactNum VARCHAR(20) UNIQUE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    age INT CHECK (age > 0)
);