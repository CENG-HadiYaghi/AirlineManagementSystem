# Airline Management System ✈️

## Overview
A comprehensive Java Swing-based application for managing airline operations, featuring role-based access control with Admin and Reservation Agent functionalities. Built using NetBeans IDE with MySQL database integration.

## Key Features

### Admin Module
- Secure authentication system
- Full CRUD operations for:
  - Employee management
  - Aircraft inventory
  - Airport information
  - Reservation records
  - Passenger details
  - Flight schedules

### Reservation Agent Module
- Passenger registration system
- Real-time flight pricing
- Reservation management
- Automated PDF receipt generation

## Technical Specifications

### Core Technologies
- **Frontend**: Java Swing GUI
- **Backend**: MySQL 8.0+
- **Development Environment**: NetBeans IDE 12+

### Key Dependencies
- [iText 7](https://itextpdf.com/en) - PDF generation library
- [JCalendar 1.4](https://toedter.com/jcalendar/) - Date picker component

## Installation Guide

### Prerequisites
- Java JDK 11+
- MySQL Server 8.0+
- NetBeans IDE 12+ (recommended)

### Database Setup
1. Create MySQL database:
   ```sql
   CREATE DATABASE airline_db;
   ```
2. Import initial schema and data:
   ```bash
   mysql -u [username] -p airline_db < airline_management_system.sql
   ```

### Project Configuration
1. Clone the repository
2. Open project in NetBeans
3. Add required libraries:
   - `itextpdf-7.x.x.jar`
   - `jcalendar-1.4.jar`

4. Configure database connection in `Server.java`:
   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/airline_db";
   private static final String USER = "your_username";
   private static final String PASSWORD = "your_password";
   ```

## Usage Instructions

### System Access
1. Launch the application from NetBeans
2. Authenticate using valid credentials:
   - Admin: Full system access
   - Agent: Restricted to reservation functions

### Key Operations
- **Flight Management**: Schedule/update flight routes
- **Passenger Handling**: Register/view passenger details
- **Reservation System**: Book flights, generate tickets
- **Reporting**: Export receipts as PDF documents

## Technical Documentation
The system implements MVC architecture with:
- **Data Layer**: MySQL JDBC connectivity
- **Business Logic**: Java service classes
- **Presentation**: Swing UI components

## Support & Maintenance
For technical issues, please ensure:
1. MySQL service is running
2. JDBC connector is properly configured
3. All dependencies are in project classpath

## License
MIT License - See LICENSE file for details

## Version Information
Current version: 1.0.0  
Last updated: August 2023

---

*Note: This documentation assumes basic familiarity with Java Swing and MySQL administration. For detailed implementation questions, refer to the source code comments.*
