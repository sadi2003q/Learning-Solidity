# 🔧 Solidity Development Setup Guide
### Running Solidity in IntelliJ IDEA / Visual Studio Code

> **Note:** This is an unofficial community template optimized for Windows development through WSL2.

---

## 📋 Prerequisites

Before starting, ensure you have the following installed:

- ✅ **WSL2** (Windows Subsystem for Linux 2)
- ✅ **IntelliJ IDEA** or **Visual Studio Code**

> ⚠️ **Important:** Standard PowerShell commands will not work. You must use **Git Bash** or **WSL2 terminal**.

---

## 🚀 Initial Setup

### Step 1: Project Initialization
Create a new folder for your Solidity project and open it in your IDE.

### Step 2: Terminal Configuration
Open the integrated terminal in your IDE.

### Step 3: Install Foundry
Execute the following commands in sequence:

```bash
# Verify WSL2 installation
wsl

# Install Foundry
curl -L https://foundry.paradigm.xyz | bash

# Update shell configuration
source /home/sadi2003q/.bashrc

# Complete Foundry installation
foundryup
```

### Step 4: Git Repository Setup
In a separate terminal, initialize version control:

```bash
git init
git add .
git commit -m "Initial commit"
```

### Step 5: Build Verification
```bash
forge build
```
expected output:
```bash
Nothing to compile.
```

### Step 6: Install Dependencies
```bash
forge install foundry-rs/forge-std
```

---

## 💻 Development Workflows

### Approach A: Development Mode (Recommended for Testing)

**Step 7: Create a Contract File**

If the `src` folder doesn't exist:
```bash
mkdir -p src
touch src/<fileName>.sol
```

If the `src` folder already exists:
```bash
touch src/<fileName>.sol
```

**Step 8: Build Contract**
```bash
forge build
```

**Step 9: Run Tests**
```bash
forge test -vv --match-path src/<fileName>.sol
```

---

### Approach B: Production Mode (Recommended for Deployment)

**Step 7: Project Structure Setup**

Create the necessary directories:
```bash
mkdir -p src test
```

Create your contract file:
```bash
touch src/<fileName>.sol
```

Create your test file:
```bash
touch test/<fileName>.t.sol
```

**Step 8: Run All Tests**
```bash
forge test -vv
```

---

## 📝 File Naming Conventions

- **Contract Files:** `ContractName.sol` (in `src/` directory)
- **Test Files:** `ContractName.t.sol` (in `test/` directory)

---

## 🛠️ Common Commands Reference

| Command | Description |
|---------|-------------|
| `forge build` | Compile all contracts |
| `forge test` | Run all tests |
| `forge test -vv` | Run tests with verbose output |
| `forge test --match-path <path>` | Run specific test file |
| `forge install <package>` | Install dependencies |

---

## 📚 Additional Resources

- [Foundry Documentation](https://book.getfoundry.sh/)
- [Solidity Documentation](https://docs.soliditylang.org/)

---

## 👤 Author

**Built and maintained by:** [Md. Adnan Abdullah Sadi]  
**GitHub:** [@sadi2003q](https://github.com/sadi2003q)  
**Contact:** _Adnanabdullah625@gmail.com_

> This open-source template was created to simplify Solidity development on Windows using WSL2. Contributions and suggestions are welcome!

---

## 📄 License

This template is open source and available under the [MIT License](LICENSE).

**Last Updated:** January 2026