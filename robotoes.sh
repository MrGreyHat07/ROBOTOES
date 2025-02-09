#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 [-l|--list <url_list_file>] [-u|--url <url>] [-h|--help]"
    echo "  -l, --list    Specify a file containing a list of robots.txt URLs"
    echo "  -u, --url     Specify a single robots.txt URL"
    echo "  -h, --help    Display this help message"
    exit 1
}


display_ascii_art() {
    echo -e "\e[32m
██████╗  ██████╗ ██████╗  ██████╗ ████████╗ ██████╗ ███████╗███████╗
██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔═══██╗██╔════╝██╔════╝
██████╔╝██║   ██║██████╔╝██║   ██║   ██║   ██║   ██║█████╗  ███████╗
██╔══██╗██║   ██║██╔══██╗██║   ██║   ██║   ██║   ██║██╔══╝  ╚════██║
██║  ██║╚██████╔╝██████╔╝╚██████╔╝   ██║   ╚██████╔╝███████╗███████║
╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝    ╚═╝    ╚═════╝ ╚══════╝╚══════╝
    \e[0m"
}

display_author(){
echo -e "\e[32m Author:- @MrGreyHat07 \e[0m"
}


# Check if at least one argument is provided
if [ "$#" -eq 0 ]; then
    display_help
fi

# Initialize variables
url_list_file=""
single_url=""

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -l|--list)
            url_list_file="$2"
            shift 2
            ;;
        -u|--url)
            single_url="$2"
            shift 2
            ;;
        -h|--help)
            display_help
            ;;
        *)
            display_help
            ;;
    esac
done

# Display ASCII art
display_ascii_art

# Display Author
display_author

# Function to process each URL
process_url() {
    url="$1"
    root_url=$(echo "$url" | awk -F"/robots.txt" '{print $1}')
    robots_txt_content=$(curl -s "$url")
    echo "$robots_txt_content" | grep -Eo "^Disallow: /[^ ]+" | while read -r line; do
        path=$(echo "$line" | cut -d' ' -f2)
        echo "$root_url$path"
    done
}

export -f process_url

# Process single URL if provided
if [ -n "$single_url" ]; then
    process_url "$single_url"
fi

# Process list of URLs if provided
if [ -n "$url_list_file" ]; then
    if [ ! -f "$url_list_file" ]; then
        echo "File not found: $url_list_file"
        exit 1
    fi
    cat "$url_list_file" | parallel -j 10 process_url {}
fi

# Display help message if no URL or list is provided
if [ -z "$single_url" ] && [ -z "$url_list_file" ]; then
    display_help
fi
