# Airbnb Clone Database Seed

## Overview

This project is part of the Airbnb Clone, focusing on creating a database seed script to populate the database with sample data. The primary objective of this task is to insert realistic sample data into the database to simulate real-world usage, covering entities such as Users, Properties, Bookings, Payments, Reviews, and Messages.

## Project Structure

The seed script is located in the `database-script-0x02` directory and contains the following components:

* **seed.sql**: The SQL script to populate the database with sample data.
* **README.md**: Documentation explaining the purpose, structure, and details of the data used in the seed script.

## Seed Data Description

The seed script covers the following entities:

### Users

Contains sample users with fields such as:

* `user_id`: Unique identifier (UUID format).
* `first_name`: User's first name.
* `last_name`: User's last name.
* `email`: User's email address.
* `password_hash`: Encrypted password for authentication.
* `phone_number`: Contact number.
* `role`: Defines whether the user is a guest, host, or admin.

### Properties

Defines various properties with details like:

* `property_id`: Unique identifier.
* `host_id`: ID of the host who owns the property.
* `name`: Name of the property.
* `description`: Brief description of the property.
* `location`: City or area where the property is located.
* `pricepernight`: Cost per night for booking.

### Bookings

Represents booking data with attributes:

* `booking_id`: Unique booking reference.
* `property_id`: The property associated with the booking.
* `user_id`: User who made the booking.
* `start_date`, `end_date`: The period of the stay.
* `total_price`: Calculated cost for the stay.
* `status`: Indicates booking status (confirmed, pending, canceled).

### Payments

Records of payment transactions including:

* `payment_id`: Unique payment reference.
* `booking_id`: The booking associated with the payment.
* `amount`: Payment amount.
* `payment_method`: Method used (credit\_card, paypal, stripe).

### Reviews

User reviews of properties containing:

* `review_id`: Unique identifier.
* `property_id`: Associated property ID.
* `user_id`: User who made the review.
* `rating`: Numerical rating given by the user.
* `comment`: Text review.

### Messages

Messages exchanged between users:

* `message_id`: Unique identifier for the message.
* `sender_id`: ID of the user sending the message.
* `recipient_id`: ID of the user receiving the message.
* `message_body`: Content of the message.

## Running the Seed Script

To run the seed script, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/username/alx-airbnb-database.git
   ```

2. Navigate to the directory:

   ```bash
   cd alx-airbnb-database/database-script-0x01
   ```

3. Run the script in your PostgreSQL environment:

   ```bash
   psql -U username -d airbnb_db -f schema.sql
   ```

4. Navigate to the directory:

   ```bash
   cd alx-airbnb-database/database-script-0x02
   ```

5. Run the script in your PostgreSQL environment:

   ```bash
   psql -U username -d airbnb_db -f seed.sql
   ```
