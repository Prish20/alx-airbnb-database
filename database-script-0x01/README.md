# Airbnb Database Schema

## Project Overview

This document provides a detailed overview of the Airbnb-like database schema. The schema is designed to efficiently manage user data, property listings, bookings, payments, reviews, and messaging. The database structure ensures data integrity and performance through normalization, indexing, and proper use of foreign key relationships.

### Purpose:

* Efficiently store and manage data for an Airbnb-like application.
* Ensure data consistency and integrity using primary and foreign keys.
* Optimize query performance with strategic indexing.

## Entities and Relationships

The database consists of the following core entities:

* **User:** Stores user-related information including name, email, and role.
* **Property:** Represents listings hosted by users.
* **Booking:** Tracks reservations made by users for specific properties.
* **Payment:** Records transactions related to bookings.
* **Review:** Stores feedback provided by users for properties.
* **Message:** Manages user-to-user communication.

## Database Schema Details

### 1. User Table

Stores basic user information including credentials and role.

* **Primary Key:** `user_id` (UUID)
* **Indexed Field:** `email` for fast lookup
* **Attributes:** first\_name, last\_name, email, password\_hash, phone\_number, role, created\_at

### 2. Property Table

Represents user-hosted listings with descriptions and pricing.

* **Primary Key:** `property_id` (UUID)
* **Foreign Key:** `host_id` references `users(user_id)`
* **Indexed Field:** `host_id` for quick host property retrieval
* **Attributes:** name, description, location, pricepernight, created\_at, updated\_at

### 3. Booking Table

Manages reservations between users and properties.

* **Primary Key:** `booking_id` (UUID)
* **Foreign Keys:** `property_id` (Property), `user_id` (User)
* **Indexed Fields:** `property_id`, `user_id` for booking retrieval
* **Attributes:** start\_date, end\_date, total\_price, status, created\_at

### 4. Payment Table

Stores financial transactions related to bookings.

* **Primary Key:** `payment_id` (UUID)
* **Foreign Key:** `booking_id` references `bookings(booking_id)`
* **Indexed Field:** `booking_id` for fast payment verification
* **Attributes:** amount, payment\_date, payment\_method

### 5. Review Table

Contains user feedback about properties.

* **Primary Key:** `review_id` (UUID)
* **Foreign Keys:** `property_id` (Property), `user_id` (User)
* **Indexed Field:** `property_id` for fast review access
* **Attributes:** rating, comment, created\_at

### 6. Message Table

Handles user-to-user communication within the platform.

* **Primary Key:** `message_id` (UUID)
* **Foreign Keys:** `sender_id`, `recipient_id` reference `users(user_id)`
* **Indexed Fields:** `sender_id`, `recipient_id` for fast message retrieval
* **Attributes:** message\_body, sent\_at

## Indexing Strategy

Primary keys are automatically indexed. Additional indexes have been created to improve the efficiency of frequently queried fields:

* **User Table:** Email (indexed) for fast user lookup.
* **Property Table:** Host ID for fast property retrieval by user.
* **Booking Table:** User ID and Property ID for booking lookups.
* **Payment Table:** Booking ID to quickly verify payments.
* **Review Table:** Property ID for fast review retrieval.
* **Message Table:** Sender ID and Recipient ID to facilitate message searches.

## Constraints and Data Integrity

1. **User Table:** Unique constraint on email to prevent duplicates.
2. **Property Table:** Foreign key constraint on `host_id` to link users with properties.
3. **Booking Table:** Foreign key constraints on `property_id` and `user_id` to maintain booking integrity.
4. **Payment Table:** Foreign key on `booking_id` to ensure payments correspond to valid bookings.
5. **Review Table:** Foreign key constraints and rating validation (1-5).
6. **Message Table:** Foreign keys on `sender_id` and `recipient_id` to maintain user relationships.

## Performance Optimization

* Indexes are created on fields that are frequently searched, sorted, or joined.
* ENUM fields (role, status, payment method) are used instead of separate tables for efficiency.

## Conclusion

The Airbnb database schema is designed to meet real-world needs by balancing data integrity and performance. Proper normalization ensures minimal redundancy, while strategic indexing accelerates data retrieval.
