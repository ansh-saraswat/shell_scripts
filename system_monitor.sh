#!/bin/bash

# Log file where system statistics will be stored
LOG_FILE="/var/log/system_monitor.log"

# Function to get current timestamp
timestamp() {
  date "+%Y-%m-%d %H:%M:%S"
}

# Function to log system statistics (disk, memory, and CPU)
log_system_stats() {
  # Get current timestamp
  TIMESTAMP=$(timestamp)
  
  # Get disk usage
  DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
  
  # Get memory usage
  MEM_USAGE=$(free -h | grep Mem | awk '{print $3 "/" $2}')
  
  # Get CPU utilization
  CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1 "%"}')

  # Log the data into the log file with timestamp
  echo "$TIMESTAMP - Disk Usage: $DISK_USAGE, Memory Usage: $MEM_USAGE, CPU Usage: $CPU_USAGE" >> $LOG_FILE
}

# Ensure the log file exists
touch $LOG_FILE



# Make script executable    chmod +x system_monitor.sh
# Run script                sudo ./system_monitor.sh


# Setup cronjob             sudo crontab -e
# Add lines                 0 */2 * * * /path/to/system_monitor.sh