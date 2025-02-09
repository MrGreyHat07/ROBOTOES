This Bash script fetches and processes `robots.txt` files from specified URLs. It extracts the disallowed paths and outputs the full URLs for each disallowed path.

## Features

- Process a single `robots.txt` URL.
- Process a list of `robots.txt` URLs from a file.

## Prerequisites

Make sure you have the following installed:

- **Curl**: A command-line tool for transferring data with URLs. You can check if it's installed by running:
  ```bash
  curl --version
  ```
  If not installed, you can install it using:
  - **On Ubuntu/Debian**:
    ```bash
    sudo apt-get install curl
    ```
  - **On macOS** (using Homebrew):
    ```bash
    brew install curl
    ```

- **GNU Parallel** (optional): A shell tool for executing jobs in parallel. You can check if it's installed by running:
  ```bash
  parallel --version
  ```
  If not installed, you can install it using:
  - **On Ubuntu/Debian**:
    ```bash
    sudo apt-get install parallel
    ```
  - **On macOS** (using Homebrew):
    ```bash
    brew install parallel
    ```

## Installation

1. **Clone the repository**:
   Open a terminal and run the following command to clone the repository:
   ```bash
   git clone https://github.com/MrGreyHat07/ROBOTOES.git
   ```

2. **Navigate to the repository directory**:
   ```bash
   cd ROBOTOES
   ```

3. **Make the script executable**:
   ```bash
   chmod +x robots_processor.sh
   ```

## Usage

```bash
./robots_processor.sh [-l|--list <url_list_file>] [-u|--url <url>] [-h|--help]
```

### Options:

- `-l`, `--list`: Specify a file containing a list of `robots.txt` URLs (one per line).
- `-u`, `--url`: Specify a single `robots.txt` URL to process.
- `-h`, `--help`: Display a help message.

### Example

To process a single URL:
```bash
./robots_processor.sh -u "http://example.com/robots.txt"
```

To process a list of URLs from a file:
```bash
./robots_processor.sh -l "url_list.txt"
```

## Script Details

- The script begins by checking if any arguments are provided, and displays a help message if none are found.
- It initializes variables to hold the list of URLs or a single URL.
- The script uses `curl` to fetch the content of the specified `robots.txt` files.
- It extracts all disallowed paths from the `robots.txt` files and constructs full URLs based on the root domains.
- Results are printed to the terminal.

## Display

The script includes an ASCII art header and author signature, enhancing its visual appeal.

## Author

This script was authored by [@MrGreyHat07](https://github.com/MrGreyHat07).

## License
This project is licensed under the MIT License.
