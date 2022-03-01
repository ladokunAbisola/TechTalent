create database BikeStores; 
CREATE TABLE sales.stores (
	store_id INT PRIMARY KEY,
	store_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255),
	street VARCHAR (255),
	city VARCHAR (255),
	state VARCHAR (10),
	zip_code VARCHAR (5)
);

CREATE TABLE sales.taxes (
	tax_id INT PRIMARY KEY,
	state VARCHAR (50) NOT NULL UNIQUE,
	state_tax_rate DEC (3, 2),
	avg_local_tax_rate DEC (3, 2),
	combined_rate BIGINT AS (state_tax_rate + avg_local_tax_rate),
	max_local_tax_rate DEC (3, 2),
	updated_at datetime
);

CREATE TABLE sales.staffs (
	staff_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	phone VARCHAR (25),
	active tinyint NOT NULL,
	store_id INT NOT NULL,
	manager_id INT,
	FOREIGN KEY (store_id) 
        REFERENCES sales.stores (store_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) 
        REFERENCES sales.staffs (staff_id) 
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO sales.taxes(state,state_tax_rate,avg_local_tax_rate,max_local_tax_rate) VALUES('Alabama',0.04,0.05,0.07);
SELECT * FROM sales.staffs;
DELETE
FROM
    sales.stores
WHERE
    city = 'Dallas';
    

SELECT
    staff_id,
    first_name,
    last_name
FROM
    sales.staffs
WHERE
    EXISTS (SELECT NULL)
ORDER BY
    first_name,
    last_name;
