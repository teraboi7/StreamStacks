# StreamStacks

StreamStacks is a Stacks blockchain smart contract project enabling streamers to register and receive tips from viewers. The contract maintains a leaderboard of top tippers, which can be used for off-chain badge minting or rewards.

## Features

- **Streamer Registration:** Users can register as streamers on-chain.
- **Tipping:** Anyone can tip a registered streamer using STX.
- **Leaderboard:** Tracks the total amount tipped by each user, enabling recognition of top tippers.
- **Devnet Ready:** Includes a local devnet configuration with pre-funded accounts for easy testing.
- **Automated Testing:** Uses Vitest and Clarinet SDK for contract testing.

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) (v18+ recommended)
- [Clarinet](https://docs.hiro.so/clarinet/get-started/installation) (for contract development and testing)

### Installation

1. Clone the repository.
2. Install dependencies:

   ```sh
   npm install
   ```

### Running Tests

To run all tests:

```sh
npm test
```

To run tests with coverage and cost reports:

```sh
npm run test:report
```

To watch for changes and re-run tests automatically:

```sh
npm run test:watch
```

### Contract Overview

- **contracts/StreamStacks.clar**  
  Main smart contract for streamer registration, tipping, and leaderboard tracking.

### Devnet Configuration

- **settings/Devnet.toml**  
  Pre-configured accounts and stacking orders for local development.

### Project Structure

```
contracts/         # Clarity smart contracts
tests/             # Vitest test files
settings/          # Network and account configuration
.vscode/           # Editor settings and tasks
```

## Resources

- [Stacks Documentation](https://docs.stacks.co/)
- [Clarinet SDK](https://docs.hiro.so/stacks/clarinet-js-sdk)
- [Vitest](https://vitest.dev/)
