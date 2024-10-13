--
-- SC2207
-- Sample Data
--

BEGIN TRANSACTION;

-- Insert data into User table
INSERT INTO [User] (nric, [name], contactnum, password, email) VALUES
('S1234567A', 'John Doe', '+6598765432', 'password123', 'john.doe@example.com'),
(
    'S2345678B',
    'Jane Smith',
    '+6598765433',
    'password456',
    'jane.smith@example.com'
),
('S3456789C', 'Bob Tan', '+6598765434', 'password789', 'bob.tan@example.com'),
(
    'S4567890D',
    'Alice Lee',
    '+6598765435',
    'password321',
    'alice.lee@example.com'
),
(
    'S5678901E',
    'Charlie Lim',
    '+6598765436',
    'password654',
    'charlie.lim@example.com'
),
('S6789012F', 'Desmond Ang', '+6581235394', 'password376', 'desmond.ang@example.com'),
(
    'S7890123G',
    'Elise Chong',
    '+6592750725',
    'password563',
    'elise.chong@example.com'
),
('S8901234H', 'Frank Ow', '+6590278150', 'password062', 'frank.ow@example.com'),    
(
    'S8901234J', 
    'Gerry Tan', 
    '+6581630472', 
    'password592'
    'gerry.tan@example.com'
),
('S9012345K', 'Harold Poon', '+658224710', 'password284', harold.poon@example.com');

-- Insert data into Customer table
INSERT INTO customer (nric, intention) VALUES
('S1234567A', 'Looking for new home'),
('S2345678B', 'Selling existing property'),
('S3456789C', 'Investment opportunities'),
('S4567890D', 'Renting options'),
('S5678901E', 'Exploring market trends');

-- Insert data into Agent table
INSERT INTO agent (nric, licensenum, licenseexpiry) VALUES
('S1234567A', 'LIC12345', '2025-12-31'),
('S2345678B', 'LIC23456', '2024-11-30'),
('S3456789C', 'LIC34567', '2026-10-15'),
('S4567890D', 'LIC45678', '2023-09-20'),
('S5678901E', 'LIC56789', '2025-08-25');

-- Insert data into Agency table
INSERT INTO agency ([Name], establishedyear) VALUES
('PropNex Realty Pte Ltd', '1999'),
('ERA Realty Network Pte Ltd', '1982'),
('Huttons Asia Pte Ltd', '2002'),
('OrangeTee & Tie Pte Ltd', '2000'),
('SRI Pte Ltd', '2016');

-- Insert data into PropertyOwner table
INSERT INTO propertyowner (nric, [name], contactnum, gender, age) VALUES
('S6789012F', 'Desmond Ang', '+6581235394', 'M', '50'),
('S7890123G', 'Elise Chong', '+6592750725', 'F', '26'),
('S8901234H', 'Frank Ow', '+6590278150', 'M', '44'),
('S8901234J', 'Gerry Tan', '+6581630472', 'F', '63'),
('S9012345K', 'Harold Poon', '+658224710', 'M', '38');    

-- Insert data into Listing table
INSERT INTO listing (id, createdon, unitnum) VALUES
('1', '2023-03-15', '13-05')
('2', '2021-07-22', '01-018'),
('3', '2022-11-05', '17-364'),
('4', '2024-01-09', '09-02'),
('5', '2020-05-30', '15-127');
    
COMMIT;
