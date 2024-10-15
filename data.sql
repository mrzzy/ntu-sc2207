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
(
    'S6789012F',
    'Desmond Ang',
    '+6581235394',
    'password376',
    'desmond.ang@example.com'
),
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
    'password592',
    'gerry.tan@example.com'
),
(
    'S9012345K',
    'Harold Poon',
    '+658224710',
    'password284',
    'harold.poon@example.com'
);

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
INSERT INTO agency ([name], establishedyear) VALUES
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
INSERT INTO listing (createdon, unitnum) VALUES
('2023-03-15', '13-05'),
('2021-07-22', '01-018'),
('2022-11-05', '17-364'),
('2024-01-09', '09-02'),
('2020-05-30', '15-127');

-- Insert into R2 before inserting into R1
INSERT INTO property_r2 (postcode, street) VALUES
('123456', 'Orchard Road'),
('123467', 'Sengkang Road'),
('123478', 'Bukit Timah Road'),
('123489', 'Tampines Avenue'),
('123490', 'Yishun Ring Road');

-- Insert data into Property tables
INSERT INTO property_r1 (
    unitnum, propertyownerid, type, postcode, size, furnishing
) VALUES
(101, 1, 'Condo', '123456', 1000, 'Furnished'),
(102, 2, 'Apartment', '123467', 850, 'Unfurnished'),
(103, 3, 'HDB', '123478', 900, 'Partially Furnished'),
(104, 4, 'Bungalow', '123489', 2000, 'Furnished'),
(105, 5, 'Terrace', '123490', 1200, 'Unfurnished');
-- Insert data into Sale table
INSERT INTO sale (listingid, price, buildyear, tenure) VALUES
(1, 850000, 2010, 'Freehold'),
(2, 650000, 2012, '99-year Leasehold'),
(3, 750000, 2015, '999-year Leasehold'),
(4, 920000, 2018, 'Freehold'),
(5, 670000, 2020, '99-year Leasehold');

-- Insert data into Rental table
INSERT INTO rental (listingid, hasutilities, hasaircon) VALUES
(1, 'TRUE', 'TRUE'),
(2, 'FALSE', 'TRUE'),
(3, 'TRUE', 'FALSE'),
(4, 'TRUE', 'TRUE'),
(5, 'FALSE', 'FALSE');

-- Insert data into shorttermrental table
INSERT INTO shorttermrental (listingid, dailyrental) VALUES
(1, 20.20),
(2, 30.30),
(3, 25.20),
(4, 20.30),
(5, 24.20);

-- Insert data into longtermrental table
INSERT INTO longtermrental (
    listingid, monthlyrental, minstay, allowvisitors
) VALUES
(1, 345.50, 21, 'FALSE'),
(2, 332.50, 22, 'TRUE'),
(3, 300.40, 20, 'TRUE'),
(4, 355.50, 25, 'FALSE'),
(5, 322.50, 24, 'TRUE');

-- Insert data into Engagement table
INSERT INTO engagement (customerid, listingid) VALUES
('S1234567A', 1),
('S2345678B', 2),
('S3456789C', 3),
('S4567890D', 4),
('S5678901E', 5),
('S1234567A', 3),
('S2345678B', 5);

-- Insert data into Appointment table
INSERT INTO appointment (
    customerid, listingid, appointmentdate, appointmenttime
) VALUES
('S1234567A', 1, '2024-10-20', '14:00'),
('S2345678B', 2, '2024-10-21', '10:30'),
('S3456789C', 3, '2024-10-22', '16:45'),
('S4567890D', 4, '2024-10-23', '11:15'),
('S5678901E', 5, '2024-10-24', '15:30'),
('S1234567A', 3, '2024-10-25', '09:00'),
('S2345678B', 5, '2024-10-26', '13:45');

-- Insert data into AppointmentLog table
INSERT INTO appointmentlog (
    customerid, listingid, appointmentdate, time, status, actionby
) VALUES
('S1234567A', 1, '2024-10-20', '2024-10-20 14:00', 'Scheduled', 'S1234567A'),
('S2345678B', 2, '2024-10-21', '2024-10-21 10:30', 'Scheduled', 'S2345678B'),
('S3456789C', 3, '2024-10-22', '2024-10-22 16:45', 'Scheduled', 'S3456789C'),
('S4567890D', 4, '2024-10-23', '2024-10-23 11:15', 'Scheduled', 'S4567890D'),
('S5678901E', 5, '2024-10-24', '2024-10-24 15:30', 'Scheduled', 'S5678901E'),
('S1234567A', 1, '2024-10-20', '2024-10-20 14:15', 'Started', 'S1234567A'),
('S2345678B', 2, '2024-10-21', '2024-10-21 10:45', 'Started', 'S2345678B'),
('S3456789C', 3, '2024-10-22', '2024-10-22 17:00', 'Started', 'S3456789C'),
('S4567890D', 4, '2024-10-23', '2024-10-23 11:30', 'Started', 'S4567890D'),
('S5678901E', 5, '2024-10-24', '2024-10-24 15:45', 'Started', 'S5678901E');

COMMIT;
