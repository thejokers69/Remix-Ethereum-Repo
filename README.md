REMIX DEFAULT WORKSPACE

Remix default workspace is present when:
i. Remix loads for the very first time 
ii. A new workspace is created with 'Default' template
iii. There are no files existing in the File Explorer

This workspace contains 3 directories:

1. 'contracts': Holds three contracts with increasing levels of complexity.
2. 'scripts': Contains four typescript files to deploy a contract. It is explained below.
3. 'tests': Contains one Solidity test file for 'Ballot' contract & one JS test file for 'Storage' contract.

SCRIPTS

The 'scripts' folder has four typescript files which help to deploy the 'Storage' contract using 'web3.js' and 'ethers.js' libraries.

For the deployment of any other contract, just update the contract name from 'Storage' to the desired contract and provide constructor arguments accordingly 
in the file `deploy_with_ethers.ts` or  `deploy_with_web3.ts`

In the 'tests' folder there is a script containing Mocha-Chai unit tests for 'Storage' contract.

To run a script, right click on file name in the file explorer and click 'Run'. Remember, Solidity file must already be compiled.
Output from script will appear in remix terminal.

Please note, require/import is supported in a limited manner for Remix supported modules.
For now, modules supported by Remix are ethers, web3, swarmgw, chai, multihashes, remix and hardhat only for hardhat.ethers object/plugin.
For unsupported modules, an error like this will be thrown: '<module_name> module require is not supported by Remix IDE' will be shown.

## Smart Contract Development - ContratVente

### Brief Description
I am working on a Solidity smart contract called `ContratVente` as part of a blockchain assignment (TP 5). The contract models a simple sale where a seller lists an item at a fixed price, a buyer purchases it with Ether, and the seller confirms delivery to release funds.

### Key Features Implemented
- Seller address (payable), buyer address, and price variables
- Enum for sale states (Disponible, Paye, Livre)
- Constructor initializing the seller and price
- Functions: `acheter()`, `confirmerLivraison()`, `rembourserAcheteur()`, and `getEtat()`

### Development and Testing
I’m using Remix Ethereum IDE to develop and test the contract.

### Screenshot
The screenshot shows my Remix Ethereum IDE environment.
- On the left, the "Deploy & Run Transactions" panel displays the deployed `ContratVente` contract at address 0x0B... with a balance of 1 ETH.
- The panel shows the contract's functions (`acheter`, `confirmerLivraison`, `rembourserAcheteur`, `getEtat`) and state variables (`acheteur`, `prix`, `vendeur`, `etat`).
- The center shows the code for `5_ContratVente.sol`, including the constructor and `acheter` function.
- The bottom right shows transaction logs, including a successful `acheter()` call with 1 ETH (1000000000000000000 wei) and a failed `acheter()` call with an error ("Montant exact requis").
- This demonstrates my progress in testing the contract's functionality and debugging issues.

![Screenshot of Remix Environment](images/remix-screenshot.png)
