-- Listing table
CREATE TABLE Listing (
    id INT PRIMARY KEY IDENTITY(1,1),
    createdOn DATE NOT NULL,
    unitNum VARCHAR(50) NOT NULL
);
