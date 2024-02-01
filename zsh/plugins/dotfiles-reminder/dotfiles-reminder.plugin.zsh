# Get the current date
current_date=$(date +%Y-%m-%d)

# Path to the file where the last reminder date is stored
last_reminder_file="$HOME/.last_dotfiles_reminder"

# Function to remind the user
remind_user() {
    echo "Reminder: It's time to push your dotfiles to GitHub!"
    echo $current_date > "$last_reminder_file"
}

# Check if the reminder file exists
if [[ ! -f "$last_reminder_file" ]]; then
    # If the file doesn't exist, remind the user immediately
    remind_user
else
    # Read the last reminder date
    last_reminder_date=$(cat "$last_reminder_file")

    # Calculate the difference in days between the current date and the last reminder
    diff=$(( ($(date -d "$current_date" +%s) - $(date -d "$last_reminder_date" +%s)) / 86400 ))

    # If more than 30 days have passed, remind the user
    if [ $diff -ge 30 ]; then
        remind_user
    fi
fi
