# CentOS 7.6 Repository

This repository contains various scripts and configurations for setting up and managing environments on CentOS 7.6.

## Contents

- [installations/install_git_246.sh](#install_git_246sh)

## installations/install_git_246.sh

This script installs Git version 2.46.0 on CentOS 7.6 from source. It also ensures that `curl` is updated to version 7.68.0 or later.

### Prerequisites

- CentOS 7.6
- Root or sudo access

### Usage

1. Clone the repository:
   ```sh
   git clone https://github.com/hinxvietti/centos76.git
   cd centos76/installations
   ```

2. Make the script executable:
   ```sh
   chmod +x install_git_246.sh
   ```

3. Run the script:
   ```sh
   sudo ./install_git_246.sh
   ```

### What the Script Does

- Updates the system packages.
- Installs the necessary development tools and libraries.
- Ensures `wget` is installed.
- Checks and updates `curl` to version 7.68.0 or later if necessary.
- Downloads, compiles, and installs Git version 2.46.0 from source.

### Author

- [hinxvietti](https://github.com/hinxvietti)

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

### Acknowledgments

- Thanks to the CentOS and Git communities for their excellent tools and documentation.
