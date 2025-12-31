# greeting
pfetch
cat << EOF
$(print -P '%{\e[38;2;198;160;246m%}')
Hello, human :)
$(print -P '%{\e[0m%}')
EOF

# Define RGB escape sequences
time_color=$'%{\e[38;2;245;189;230m%}'   # #f5bde6
day_color=$'%{\e[38;2;237;135;150m%}'    # #ed8796
reset=$'%{\e[0m%}'

# Get current time (12-hour format) and day of the week
current_time=$(date +"%I:%M %p")
day_of_week=$(date +"%b %e, %A")

# Pick a random adjective
#adjectives=("beautiful" "gorgeous" "wonderful")
#random_adj=${adjectives[RANDOM % ${#adjectives[@]} + 1]}
# a ${random_adj}

# Print the styled message
print -P "It's ${time_color}${current_time}${reset} on ${day_color}${day_of_week}${reset}!"
