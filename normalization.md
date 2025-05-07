# Normalization of Airbnb Database

## Objective

The purpose of this document is to explain the normalization process of the Airbnb database to ensure it is in the Third Normal Form (3NF). Normalization eliminates redundancy, maintains data integrity, and improves database efficiency.

## Normal Forms Applied

To achieve optimal data organization, the following normal forms were applied:

1. **First Normal Form (1NF)**: Eliminates repeating groups and ensures atomicity of attributes.
2. **Second Normal Form (2NF)**: Removes partial dependencies, ensuring all non-key attributes depend on the entire primary key.
3. **Third Normal Form (3NF)**: Eliminates transitive dependencies, ensuring no non-key attribute depends on another non-key attribute.

## Step 1: Analyzing the Current Schema

We reviewed each table to ensure compliance with normalization rules. Below is the breakdown of each entity and how they meet 3NF requirements.

### User Table

* **1NF Check:** All fields contain atomic values. No repeating groups.
* **2NF Check:** Since `user_id` is the primary key, all attributes are fully dependent on it.
* **3NF Check:** No transitive dependencies. All attributes directly depend on `user_id`.

### Property Table

* **1NF Check:** Atomic values with no repeating groups.
* **2NF Check:** Primary key (`property_id`) is not partially dependent on any non-key attribute.
* **3NF Check:** All attributes directly depend on `property_id`, with no transitive relationships.

### Booking Table

* **1NF Check:** No repeating or non-atomic values.
* **2NF Check:** The primary key (`booking_id`) fully determines all other attributes.
* **3NF Check:** No attributes indirectly dependent on the primary key.

### Payment Table

* **1NF Check:** Atomic attributes with no redundancy.
* **2NF Check:** No partial dependency with `payment_id` as the primary key.
* **3NF Check:** Direct dependency of all attributes on `payment_id`.

### Review Table

* **1NF Check:** Each attribute contains atomic data.
* **2NF Check:** Primary key (`review_id`) fully determines each attribute.
* **3NF Check:** No transitive dependencies.

### Message Table

* **1NF Check:** No repeating groups, atomic attributes.
* **2NF Check:** The primary key (`message_id`) directly determines all fields.
* **3NF Check:** No non-key attribute depends on another non-key attribute.

## Justification for Compliance

All tables in the Airbnb database adhere to 3NF because:

* **No Redundancy:** No duplicate data within the tables.
* **Atomicity:** Each field holds the simplest possible value.
* **No Partial Dependencies:** All attributes are fully dependent on their primary keys.
* **No Transitive Dependencies:** Non-key attributes do not depend on other non-key attributes.

## Special Considerations

* **ENUM Fields:**

  * Role, Status, and Payment Method are stored as ENUMs rather than separate tables for simplicity and efficiency.
* **Foreign Keys:**

  * Properly defined to maintain relational integrity without violating normalization rules.

## Conclusion

The database structure has been carefully examined and adheres to the principles of normalization up to the Third Normal Form (3NF). This ensures that data is stored efficiently with minimal redundancy while maintaining data integrity.
