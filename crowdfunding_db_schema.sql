-- Dropping the tables if they exist 
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS subcategory;
DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS contacts;

-- Creating the table Category
CREATE TABLE "category" (
    "category_id" VARCHAR   NOT NULL,
    "category" VARCHAR   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);
-- Pulling the data into table
COPY category
FROM "C:\Users\samee\OneDrive\Desktop\Analysis_Projects\Project2\Crowdfunding_ETL\Resources\category.csv"
DELIMITER ','
CSV HEADER;

-- Checking if the data was pulled correctly
SELECT * FROM category;

-- Creating the table subcategory

CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR   NOT NULL,
    "subcategory" VARCHAR   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

-- Pulling the data into table
COPY subcategory
FROM "C:\Users\samee\OneDrive\Desktop\Analysis_Projects\Project2\Crowdfunding_ETL\Resources\subcategory.csv"
DELIMITER ','
CSV HEADER;

-- Checking if the data was pulled correctly
SELECT * FROM subcategory;

CREATE TABLE "campaign" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" VARCHAR   NOT NULL,
    "description" VARCHAR   NOT NULL,
    "goal" NUMERIC  NOT NULL,
    "pledged" NUMERIC   NOT NULL,
    "outcome" VARCHAR   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR   NOT NULL,
    "currency" VARCHAR   NOT NULL,
    "launch_date" timestamp without time zone NOT NULL,
    "end_date" timestamp without time zone   NOT NULL,
    "category_id" VARCHAR   NOT NULL,
    "subcategory_id" VARCHAR   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);
-- Pulling the data into table
COPY campaign
FROM "C:\Users\samee\OneDrive\Desktop\Analysis_Projects\Project2\Crowdfunding_ETL\Resources\campaign.csv"
DELIMITER ','
CSV HEADER;

-- Checking if the data was pulled correctly
SELECT * FROM campaign;


CREATE TABLE "contacts" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "email" VARCHAR   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

-- Pulling the data into table
COPY contacts
FROM "C:\Users\samee\OneDrive\Desktop\Analysis_Projects\Project2\Crowdfunding_ETL\Resources\contacts.csv"
DELIMITER ','
CSV HEADER;

-- Checking if the data was pulled correctly
SELECT * FROM contacts;

--Establishing the relation of the primary and foriegn keys

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

SELECT * FROM category;
SELECT * FROM subcategory;
SELECT * FROM campaign;
SELECT * FROM contacts;

