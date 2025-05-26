# Hotel Management System

A web-based hotel management system built with Java, JSP, and Servlets that allows users to manage hotel reservations and room bookings.

## Features

- Room reservation management
- Dynamic pricing based on room categories
- Customer information management
- Check-in and check-out date tracking
- Automatic total amount calculation based on room type

## Room Categories and Pricing

- Rooms 100-199: ₹1,000 per night
- Rooms 200-299: ₹1,500 per night
- Rooms 300-399: ₹2,200 per night

## Prerequisites

- Java Development Kit (JDK) 8 or higher
- Apache Tomcat 9.0 or higher
- Maven 3.6 or higher
- MySQL 8.0 or higher
- Web browser (Chrome, Firefox, Safari, or Edge)

## Installation

1. Clone the repository:
   ```bash
   git clone [repository-url]
   cd HotelWebApp
   ```

2. Configure the database:
   - Create a MySQL database named `hotel_db`
   - Update the database configuration in `src/main/resources/db.properties`

3. Build the project:
   ```bash
   mvn clean install
   ```

4. Deploy to Tomcat:
   - Copy the generated WAR file from `target/HotelWebApp.war` to Tomcat's webapps directory
   - Start Tomcat server

5. Access the application:
   - Open your web browser
   - Navigate to `http://localhost:8080/HotelWebApp`

## Project Structure

```
HotelWebApp/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/hotel/
│   │   │       ├── controller/
│   │   │       ├── model/
│   │   │       ├── dao/
│   │   │       └── util/
│   │   ├── resources/
│   │   │   └── db.properties
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       ├── css/
│   │       └── *.jsp
├── pom.xml
└── README.md
```

## Configuration

1. Database Configuration:
   - Edit `src/main/resources/db.properties` with your database credentials:
   ```properties
   db.url=jdbc:mysql://localhost:3306/hotel_db
   db.username=your_username
   db.password=your_password
   ```

2. Tomcat Configuration:
   - Ensure Tomcat is configured with Java 8 or higher
   - Set appropriate memory settings in `catalina.sh` or `catalina.bat`

## Usage

1. Start the application
2. Navigate to the home page
3. Use the navigation menu to access different features
4. To add a reservation:
   - Click on "Add Reservation"
   - Fill in customer details
   - Select room number
   - Choose check-in and check-out dates
   - Submit the form

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the repository or contact the development team. 
