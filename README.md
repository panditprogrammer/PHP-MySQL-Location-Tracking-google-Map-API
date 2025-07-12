

# 📄 Project: Live Location Tracker

**Developed by:** [Pandit Programmer](https://panditprogrammer.com) 
**Date:** 11/07/2025

A real-time web-based location tracker built using **PHP**, **MySQL**, **JavaScript**, **jQuery**, **Bootstrap**, and **Google Maps API**.

---

![PHP-MySQL-Live-Location-tracking-Google-Map-API](https://github.com/panditprogrammer/PHP-MySQL-Location-Tracking-google-Map-API/blob/main/Screenshot.png "Preview")

---

## 🔧 OVERVIEW

This project enables live user location tracking and history logging.

### 🔍 Technologies Used:
- **Google Maps JavaScript API** – map rendering and marker control  
- **Geolocation API** – for live tracking  
- **PHP + MySQL** – backend logic and storage  
- **Bootstrap & Alertify.js** – responsive UI and alerts  

---

## 🛠️ SETUP GUIDE

### ✅ Step 1: Create Project File
- Save the complete code as `index.php`
- Place it in your project root

### ✅ Step 2: Create Database Table
Create a MySQL database (`trackdb`) and run the following SQL:

```sql
CREATE TABLE `user_locations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `coordinates` VARCHAR(255) NOT NULL,
  `address` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`)
);
```

### ✅ Step 3: Google Maps API Key

* Replace `YOUR_API_KEY` in the `<script src="https://maps.googleapis.com/...">` tag
* In the [Google Cloud Console](https://console.cloud.google.com):

  * Restrict API key to your domain
  * Enable:

    * **Maps JavaScript API**
    * **Geocoding API**

---

## 🔐 SECURITY WARNING

* **Database Access**: Use minimal-privilege MySQL users for production.
* **API Keys**: Restrict keys to specific referrers and enable only required APIs.

---

## 📦 FILE STRUCTURE

```
project-root/
└── index.php   ← Contains PHP, HTML, CSS, and JS
```

---

## 📋 FUNCTIONALITY BREAKDOWN

### 🧠 PHP Server Logic

| Function          | Description                                 |
| ----------------- | ------------------------------------------- |
| `insert_location` | Saves location data (coordinates + address) |
| `get_logs`        | Returns last 20 locations in JSON           |
| `delete_location` | Deletes a location by ID                    |
| `export_csv`      | Exports logs as downloadable CSV            |

---

## 🌍 Frontend Interface (HTML + CSS + JS)

### 📌 Map Area

* Map rendered inside element with `id="map"`

### 📌 Control Buttons

| Button          | Functionality                   |
| --------------- | ------------------------------- |
| 📍 Locate Me    | Center map on current marker    |
| ⏸️ Pause/Resume | Toggle geolocation tracking     |
| 🕓 Show Logs    | Display past locations in modal |
| 📄 Export CSV   | Download logs as CSV file       |

### 📌 Modal: `#logsModal`

* Shows recent 20 entries with delete options

---

## 🔄 JavaScript Functional Breakdown

| Function              | Description                                                            |
| --------------------- | ---------------------------------------------------------------------- |
| `initMap()`           | Initializes map, sets default view, starts tracking                    |
| `startTracking()`     | Tracks location with `watchPosition`, calls `insertLocation()` on move |
| `updateMap(lat, lng)` | Moves or creates marker, pans/zooms                                    |
| `reverseGeocode()`    | Converts coordinates to address                                        |
| `insertLocation()`    | Sends location to PHP backend                                          |
| `fetchLogs()`         | Loads recent logs and injects into modal                               |
| `deleteLocation(id)`  | Deletes a log entry                                                    |
| `toggleTracking()`    | Pauses/resumes location tracking                                       |

---

## 📊 Visual Representation

```
[User Location] → [Google Maps Marker] → [Reverse Geocode]
       ↓                    ↓
   [updateMap]        [Address String]
       ↓                    ↓
 [insertLocation()] → [PHP → MySQL]
                            ↓
              [Fetch Logs (JSON)] ← fetchLogs()
                            ↓
                       [Logs Modal]
```

---

## 🧪 Technical Notes

### ✅ SQL Queries Used

* `INSERT INTO user_locations (...)`
* `SELECT * FROM user_locations ORDER BY id DESC LIMIT 20`
* `DELETE FROM user_locations WHERE id = ?`

### ✅ PHP Features

* `mysqli` with **prepared statements**
* `$_POST` for AJAX handling
* **Output buffering** for CSV export

### ✅ JavaScript Libraries

* **jQuery** for AJAX and DOM
* **Alertify.js** for toasts and confirmations
* **Bootstrap** for UI components
* **Google Maps JavaScript API**

---

## ✅ Best Practices Applied

* ✔️ Prepared statements (SQL injection protection)
* ✔️ Clean AJAX-based frontend/backend interaction
* ✔️ UX: modals, tooltips, status indicators
* ✔️ Logical separation of concerns between PHP and JS

---

## 🧪 Testing Checklist

| Feature               | Status |
| --------------------- | ------ |
| Location tracking     | ✅      |
| Reverse geocoding     | ✅      |
| Insert into DB        | ✅      |
| Fetch recent logs     | ✅      |
| Delete individual log | ✅      |
| Export to CSV         | ✅      |
| Mobile responsiveness | ✅      |

---

## 📌 Final Recommendations

* 🛡️ **Restrict Google API key** to specific domains
* 🗄️ **Move database credentials** to a secure config file
* 🧹 **Separate JS and CSS** into their own files
* 📤 **Paginate logs** or add date filters for large datasets

---



