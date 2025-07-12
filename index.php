<?php
/*
Pandit Programmer
11/07/2025

================================================================================
| IMPORTANT SETUP INSTRUCTIONS                                                 |
================================================================================
|
| 1. CREATE ONE FILE:
|    - Create a file named `index.php` and paste this entire block of code into Root directory.
|
| 2. DATABASE TABLE:
|    Make sure you have a table in your `trackdb` database with this structure:
|
|    CREATE TABLE `user_locations` (
|      `id` int(11) NOT NULL AUTO_INCREMENT,
|      `coordinates` varchar(255) NOT NULL,
|      `address` text NOT NULL,
|      `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
|      PRIMARY KEY (`id`)
|    );
|
| 3. SECURITY WARNINGS:
|    - DATABASE CREDENTIALS: The credentials below are for local development ONLY.
|      For a live website, create a new database user with a strong, unique
|      password and grant it permissions ONLY for this database.
|
|    - GOOGLE MAPS API KEY: Your API key is exposed on the frontend.
|      Go to your Google Cloud Console and RESTRICT the key. Add restrictions
|      for "HTTP referrers" (to allow only your website domain) and for the
|      "Maps JavaScript API" and "Geocoding API".
|
================================================================================
*/


// --- DATABASE CONNECTION ---
// IMPORTANT: Update with your credentials on a live server.
// Create connection
$conn = new mysqli("localhost", "root", "", "trackdb");

// Check connection
if ($conn->connect_error) {
    if (isset($_POST['action'])) {
        header('HTTP/1.1 500 Internal Server Error');
        echo "Database connection failed: " . $conn->connect_error;
    } else {
        die("Connection failed: " . $conn->connect_error);
    }
}


// --- ACTION HANDLER for AJAX requests ---
// This block checks if the request is an AJAX call with an 'action'.
// If so, it processes the action and then stops the script with exit().
// This prevents the HTML below from being sent back with the AJAX response.
if (isset($_POST['action'])) {
    $action = $_POST['action'];

    switch ($action) {
        case 'export_csv':
            export_all_logs_as_csv($conn);
            break;

        case 'insert_location':
            insert_new_location($conn);
            break;

        case 'get_logs':
            get_location_logs($conn);
            break;

        case 'delete_location':
            delete_specific_location($conn);
            break;

        default:
            // Send an error response for unknown actions
            header('HTTP/1.1 400 Bad Request');
            echo "Unknown action.";
            break;
    }

    // Always close the connection and stop the script for AJAX requests.
    $conn->close();
    exit;
}


// --- PHP FUNCTIONS ---

/**
 * Exports all location data to a CSV file.
 */
function export_all_logs_as_csv($conn)
{
    $result = $conn->query("SELECT id, coordinates, address, created_at FROM user_locations ORDER BY id DESC");
    if (!$result) {
        header('HTTP/1.1 500 Internal Server Error');
        die("Query failed: " . $conn->error);
    }


    $filename = "location_logs_" . date("Y-m-d_H-i") . ".csv";
    header('Content-Type: text/csv; charset=utf-8');
    header("Content-Disposition: attachment; filename=$filename");
    $output = fopen('php://output', 'w');

    // Add header row
    fputcsv($output, ['ID', 'Coordinates', 'Address', 'Created At']);

    // Add data rows
    while ($row = $result->fetch_assoc()) {
        fputcsv($output, $row);
    }

    fclose($output);
}

/**
 * Inserts a new location into the database.
 */
function insert_new_location($conn)
{
    $stmt = $conn->prepare("INSERT INTO user_locations (coordinates, address) VALUES (?, ?)");
    if (!$stmt) {
        header('HTTP/1.1 500 Internal Server Error');
        die("Prepare failed: " . $conn->error);
    }

    $coordinates = $_POST['coordinates'] ?? '';
    $address = $_POST['address'] ?? '';

    $stmt->bind_param("ss", $coordinates, $address);

    if ($stmt->execute()) {
        echo "Inserted";
    } else {
        header('HTTP/1.1 500 Internal Server Error');
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
}

/**
 * Fetches the last 20 location logs.
 */
function get_location_logs($conn)
{
    $result = $conn->query("SELECT id, coordinates, address, created_at FROM user_locations ORDER BY id DESC LIMIT 20");
    if (!$result) {
        header('HTTP/1.1 500 Internal Server Error');
        die("Query failed: " . $conn->error);
    }

    $logs = [];
    while ($row = $result->fetch_assoc()) {
        $logs[] = $row;
    }

    header('Content-Type: application/json');
    echo json_encode($logs);
}

/**
 * Deletes a specific location log by its ID.
 */
function delete_specific_location($conn)
{
    $stmt = $conn->prepare("DELETE FROM user_locations WHERE id = ?");
    if (!$stmt) {
        header('HTTP/1.1 500 Internal Server Error');
        die("Prepare failed: " . $conn->error);
    }

    $id = $_POST['id'] ?? 0;

    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Deleted";
    } else {
        header('HTTP/1.1 500 Internal Server Error');
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
}

// The PHP part ends here for a normal page load, and the script continues to output the HTML below.
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Live Location Tracker</title>
    <!-- Stylesheets -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 900px;
        }

        #map {
            width: 100%;
            height: 450px;
            border-radius: 0.5rem;
            border: 1px solid #dee2e6;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }

        #statusIndicator {
            width: 15px;
            height: 15px;
            border-radius: 50%;
            display: inline-block;
            vertical-align: middle;
            transition: background-color 0.3s ease;
        }

        .btn-group .btn {
            margin-right: 5px;
        }
    </style>
</head>

<body>
    <div class="container mt-4">
        <header class="d-flex align-items-center mb-3">
            <h6 class="me-auto"><i class="bi bi-geo-alt-fill text-danger"></i> Live Location Tracker</h6>
            <div class="d-flex align-items-center">
                <div id="statusIndicator" class="spinner-grow text-primary" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <small id="statusText" class="ms-2 text-muted small">Not tracking</small>
            </div>
        </header>

        <div class="btn-group mb-3" role="group" aria-label="Controls">
            <button class="btn btn-sm btn-primary" id="locateMeBtn" data-bs-toggle="tooltip" title="Center on Me">
                <i class="bi bi-crosshair"></i>
            </button>
            <button class="btn btn-sm btn-warning" id="toggleTrackingBtn" data-bs-toggle="tooltip" title="Pause Tracking">
                <i class="bi bi-pause-circle"></i>
            </button>
            <button class="btn btn-sm btn-secondary" id="showLogsBtn" data-bs-toggle="tooltip" title="Show Logs">
                <i class="bi bi-clock-history"></i>
            </button>
            <button class="btn btn-sm btn-success" id="exportCsvBtn" data-bs-toggle="tooltip" title="Export logs as CSV">
                <i class="bi bi-file-earmark-arrow-down"></i>
            </button>
        </div>

        <div id="map"></div>
    </div>

    <!-- Logs Modal -->
    <div class="modal fade" id="logsModal" tabindex="-1" aria-labelledby="logsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="logsModalLabel"><i class="bi bi-clock-history"></i> Last 20 Locations</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <ul id="logsList" class="list-group">
                        <!-- Logs will be dynamically inserted here -->
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!--
    SECURITY WARNING: Replace YOUR_API_KEY with your actual Google Maps API Key.
    Remember to RESTRICT this key in your Google Cloud Console to prevent unauthorized use.
    -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEcjO8zJKvLUvzdNJIs6cSCX7hzzXuFro&libraries=places&callback=initMap" async defer></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <script>
        // Global variables
        // API_URL is set to '' to post to the current page (index.php)
        const API_URL = '';
        let watchId = null;
        let map, marker;
        let logsModal;
        let lastLat = null,
            lastLng = null;
        let isTracking = true;

        // Initialize tooltips
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

        // Function to initialize the map (called by Google Maps API script)
        function initMap() {
            // Default to center of India
            map = new google.maps.Map(document.getElementById("map"), {
                zoom: 5,
                center: initialPos = {
                    lat: 20.5937,
                    lng: 78.9629
                },
            });
            startTracking(); // Start tracking after the map is ready
        }

        $(document).ready(function() {
            // Initialize modal and alertify
            logsModal = new bootstrap.Modal(document.getElementById('logsModal'));
            alertify.set('notifier', 'position', 'top-right');

            // --- EVENT LISTENERS ---

            $("#locateMeBtn").click(() => {
                if (map && marker && marker.getPosition()) {
                    map.panTo(marker.getPosition());
                    map.setZoom(16);
                } else {
                    alertify.warning('Location not yet available.');
                }
            });

            $("#exportCsvBtn").click(() => {
                // Create a temporary form to trigger the CSV download
                $('<form method="post" action="' + API_URL + '"><input type="hidden" name="action" value="export_csv"></form>')
                    .appendTo('body').submit().remove();
                alertify.success('Exporting all logs...');
            });

            $("#showLogsBtn").click(() => {
                fetchLogs();
                logsModal.show();
            });

            $("#toggleTrackingBtn").click(toggleTracking);

            // Use event delegation for delete buttons inside the modal
            $('#logsList').on('click', '.delete-log-btn', function() {
                const logId = $(this).data('id');
                deleteLocation(logId);
            });
        });

        // --- CORE FUNCTIONS ---

        function updateMap(lat, lng) {
            const pos = {
                lat,
                lng
            };
            if (!marker) {
                // Create marker for the first time
                marker = new google.maps.Marker({
                    position: pos,
                    map: map,
                    title: "You are here!",
                    animation: google.maps.Animation.DROP
                });
                map.setZoom(16);
            } else {
                marker.setPosition(pos);
            }
            map.panTo(pos);
        }

        function reverseGeocode(lat, lng, callback) {
            const geocoder = new google.maps.Geocoder();
            geocoder.geocode({
                'location': {
                    lat,
                    lng
                }
            }, (results, status) => {
                if (status === "OK" && results[0]) {
                    callback(results[0].formatted_address);
                } else {
                    console.error("Geocoder failed due to: " + status);
                    callback("Address not found");
                }
            });
        }

        function insertLocation(lat, lng) {
            const coordinates = `${lat.toFixed(6)},${lng.toFixed(6)}`;
            reverseGeocode(lat, lng, (address) => {
                $.post(API_URL, {
                        action: "insert_location",
                        coordinates,
                        address
                    })
                    .done(function(response) {
                        if (response === "Inserted") {
                            updateStatus('green', 'Tracking');
                            alertify.success("Location saved!");
                            if ($('#logsModal').is(':visible')) {
                                fetchLogs();
                            }
                            lastLat = lat;
                            lastLng = lng;
                        } else {
                            alertify.error("Insert error: " + response);
                        }
                    })
                    .fail(function(jqXHR) {
                        alertify.error("Network error during insertion: " + jqXHR.responseText);
                    });
            });
        }


        function startTracking() {
            if (!navigator.geolocation) {
                alertify.error("Geolocation is not supported by your browser.");
                return;
            }

            updateStatus('orange', 'Acquiring position...');
            const options = {
                enableHighAccuracy: true,
                maximumAge: 5000,
                timeout: 10000
            };

            watchId = navigator.geolocation.watchPosition(
                (position) => {
                    const {
                        latitude,
                        longitude
                    } = position.coords;

                    if (lastLat === null || lastLng === null) {
                        // First location
                        updateMap(latitude, longitude);
                        insertLocation(latitude, longitude);
                    } else {
                        const distance = getDistanceFromLatLonInMeters(lastLat, lastLng, latitude, longitude);
                        if (distance >= 10) {
                            updateMap(latitude, longitude);
                            insertLocation(latitude, longitude);
                        }
                    }
                },
                (error) => {
                    updateStatus('red', 'Tracking failed');
                    alertify.error(`Geolocation Error: ${error.message}`);
                },
                options
            );
        }


        function stopTracking() {
            if (watchId !== null) {
                navigator.geolocation.clearWatch(watchId);
                watchId = null;
                lastLat = null;
                lastLng = null;
            }
        }

        function toggleTracking() {
            isTracking = !isTracking;
            const $btn = $("#toggleTrackingBtn");

            if (isTracking) {
                startTracking();
                $btn.attr("data-bs-original-title", "Pause Tracking")
                    .removeClass("btn-success")
                    .addClass("btn-warning")
                    .html('<i class="bi bi-pause-circle"></i>');
            } else {
                stopTracking();
                updateStatus('red', 'Tracking paused');
                $btn.attr("data-bs-original-title", "Start Tracking")
                    .removeClass("btn-warning")
                    .addClass("btn-success")
                    .html('<i class="bi bi-play-circle"></i>');
            }
            // Re-initialize tooltip after changing its title
            $btn.tooltip('dispose').tooltip();
        }

        function fetchLogs() {
            $.post(API_URL, {
                    action: "get_logs"
                })
                .done(function(logs) {
                    const $logsList = $("#logsList");
                    $logsList.empty();
                    if (logs && logs.length) {
                        logs.forEach(log => {
                            const logHtml = `
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <div>
                                        <i class="bi bi-geo-alt-fill text-primary"></i> <a class="link link-dark text-decoration-none small" href="https://www.google.com/maps?q=${log.coordinates}"> ${log.coordinates}  </a><br/>
                                        <small><i class="bi bi-geo"></i> <strong>Address:</strong> ${log.address}</small><br/>
                                        <small class="text-muted"><i class="bi bi-calendar-check"></i> ${log.created_at}</small>
                                    </div>
                                    <button class="btn btn-outline-danger btn-sm delete-log-btn" data-id="${log.id}" data-bs-toggle="tooltip" title="Delete Log">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </li>`;
                            $logsList.append(logHtml);
                        });
                    } else {
                        $logsList.append(`<li class="list-group-item text-muted">No location logs found.</li>`);
                    }
                    // Re-initialize tooltips for new delete buttons
                    $logsList.find('[data-bs-toggle="tooltip"]').tooltip();
                })
                .fail(() => alertify.error("Failed to load logs."));
        }

        function deleteLocation(id) {
            alertify.confirm('Confirm Deletion', 'Are you sure you want to delete this log?',
                function() { // On OK
                    $.post(API_URL, {
                            action: "delete_location",
                            id: id
                        })
                        .done(function(response) {
                            if (response === "Deleted") {
                                alertify.success("Log deleted.");
                                fetchLogs(); // Refresh the logs list
                            } else {
                                alertify.error("Error deleting log: " + response);
                            }
                        })
                        .fail((jqXHR) => alertify.error("Network error: " + jqXHR.responseText));
                },
                function() { // On Cancel
                    alertify.error('Deletion cancelled.');
                }
            ).set('labels', {
                ok: 'Yes, Delete',
                cancel: 'Cancel'
            });
        }

        function updateStatus(color, text) {
            const colorMap = {
                red: 'spinner-grow text-danger',
                orange: 'spinner-grow text-warning',
                green: 'spinner-grow text-success'
            };
            $('#statusIndicator').removeClass('spinner-grow text-warning spinner-grow text-danger spinner-grow text-success').addClass(colorMap[color]);
            $('#statusText').text(text);
        }
    </script>
</body>

</html>