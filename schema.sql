
-- 1. OFFICE TABLE
CREATE TABLE office (
    office_id INT PRIMARY KEY,
    office_name VARCHAR(100),
    street VARCHAR(100),
    city VARCHAR(50),
    state CHAR(2),
    zip_code VARCHAR(10),
    phone VARCHAR(20)
);

-- 2. CLIENT TABLE
CREATE TABLE client (
    client_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    date_registered DATE
);

-- 3. PROPERTY TABLE
CREATE TABLE property (
    property_id INT PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50),
    state CHAR(2),
    zip_code VARCHAR(10),
    property_type VARCHAR(50),
    bedrooms INT,
    bathrooms DECIMAL,
    square_feet INT,
    year_built INT
);

-- 4. AGENT TABLE
CREATE TABLE agent (
    agent_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    license_no VARCHAR(50),
    hire_date DATE,
    office_id INT,
    FOREIGN KEY (office_id) REFERENCES office(office_id)
);

-- 5. LISTING TABLE
CREATE TABLE listing (
    listing_id INT PRIMARY KEY,
    property_id INT,
    agent_id INT,
    listing_type VARCHAR(50),
    list_price DECIMAL,
    list_date DATE,
    expiry_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (agent_id) REFERENCES agent(agent_id)
);

-- 6. OWNS TABLE
CREATE TABLE owns (
    client_id INT,
    property_id INT,
    ownership_pct DECIMAL,
    acquired_date DATE,
    PRIMARY KEY (client_id, property_id),
    FOREIGN KEY (client_id) REFERENCES client(client_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

-- 7. PROPERTY_FEATURE TABLE
CREATE TABLE property_feature (
    property_id INT,
    feature VARCHAR(100),
    PRIMARY KEY (property_id, feature),
    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

-- 8. SHOWING TABLE
CREATE TABLE showing (
    listing_id INT,
    showing_datetime TIMESTAMP,
    client_id INT,
    status VARCHAR(50),
    feedback VARCHAR(255),
    PRIMARY KEY (listing_id, showing_datetime),
    FOREIGN KEY (listing_id) REFERENCES listing(listing_id),
    FOREIGN KEY (client_id) REFERENCES client(client_id)
);

-- 9. OFFER TABLE
CREATE TABLE offer (
    offer_id INT PRIMARY KEY,
    listing_id INT,
    client_id INT,
    offer_amount DECIMAL,
    offer_date DATE,
    expiry_date DATE,
    financing_type VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (listing_id) REFERENCES listing(listing_id),
    FOREIGN KEY (client_id) REFERENCES client(client_id)
);

-- 10. SALE TABLE
CREATE TABLE sale (
    sale_id INT PRIMARY KEY,
    offer_id INT UNIQUE,
    closing_date DATE,
    sale_price DECIMAL,
    commission_rate DECIMAL,
    FOREIGN KEY (offer_id) REFERENCES offer(offer_id)
);
