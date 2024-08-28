# Wiki: Short URL Path Solution

## Introduction
This document provides an overview of the solution for generating short URLs in our URL Shortener service. It explains the approach, limitations, and workarounds, along with the design decisions and thought processes behind the implementation.

## Solution for Short URL Path

### Short URL Generation
- **Method**: Uses `SecureRandom.urlsafe_base64` to generate a URL-safe base64 string.
- **Length**: Set to 4 characters for brevity and uniqueness.
- **Implementation**: The `generate_short_url` method in the `Url` model ensures each short URL is unique.

#### Code Snippet
```ruby
def generate_short_url
  loop do
    self.short_url = SecureRandom.urlsafe_base64(4)
    break unless Url.exists?(short_url: short_url)
  end
end

### Uniqueness Check
- **Approach**: A loop generates new short URLs until a unique one is found.
- **Reasoning**: Ensures uniqueness without complex algorithms.

### Short URL Length
- **Constraint**: Limited to a maximum of 15 characters.
- **Current Implementation**: Uses 4 characters, adjustable if needed.

## Limitations and Workarounds

### Database Lookup Efficiency
- **Limitation**: Uniqueness check requires a database lookup.
- **Workaround**: Indexing the `short_url` column.
- **Future Improvement**: Implement caching for recently generated short URLs.

### Short URL Length Constraint
- **Limitation**: Limits the number of unique URLs.
- **Workaround**: Current 4-character length, adjustable up to 15 characters.
- **Future Improvement**: Use a custom encoding scheme or different character set.

### Security Concerns
- **Limitation**: Short URLs can be guessed or brute-forced.
- **Workaround**: Monitor and rate-limit access.
- **Future Improvement**: Implement CAPTCHA for URL creation.

## Reports Page

### Overview
The reports page provides analytics on the usage of short URLs, including total URL clicks and detailed user click logs.

### Features
- **Total URL Clicks**: Displays the total number of clicks for each short URL.
- **User Click Log**: Provides a detailed log of user clicks, including timestamps and IP addresses.

### Implementation
- **Controller**: The `ReportsController` handles the logic for fetching and displaying analytics data.
- **Views**: The `index.html.erb` file in the `app/views/reports/` directory contains the HTML and embedded Ruby code for rendering the report page.

### Limitations and Workarounds

#### Data Volume
- **Limitation**: Large volumes of click data can slow down report generation.
- **Workaround**: Implement pagination and indexing.
- **Future Improvement**: Optimize database queries and use caching to handle large datasets more efficiently.

#### Real-Time Updates
- **Limitation**: Reports are not updated in real-time.
- **Workaround**: Refresh the page to get the latest data.
- **Future Improvement**: Implement real-time updates using WebSockets or similar technology.

#### Data Privacy
- **Limitation**: Storing IP addresses may raise privacy concerns.
- **Workaround**: Anonymize IP addresses before storing.
- **Future Improvement**: Implement user consent mechanisms and comply with data protection regulations.

## Usage Instructions
1. **Generating Short URLs**: Use the provided form on the main page to generate a short URL.
2. **Accessing Reports**: Navigate to the reports page to view analytics.

## Examples
- **Short URL Generation**: Example of a generated short URL: `https://short.url/abc123`
- **Reports Page**: Screenshot or description of the reports page layout.

### Additional Sections

## Workflow Summary
1. **User Input**: User submits a long URL through the form.
2. **Short URL Generation**: The system generates a unique short URL using a secure random method.
3. **Database Storage**: The long URL and its corresponding short URL are stored in the database.
4. **Redirection**: When a user accesses the short URL, they are redirected to the original long URL.
5. **Analytics**: Click data is logged and displayed on the reports page.
