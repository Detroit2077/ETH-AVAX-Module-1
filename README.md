# Error examples! in Solidity

## Install

1. Install [Node.js](https://nodejs.org)

   Download and install from its official source.

2. Install [Truffle](https://github.com/trufflesuite/truffle)

   ```bash
   npm install -g truffle
   ```

## Initialize

1. Initialize Truffle in your project folder directory

   ```bash
   truffle init
   ```

   After initialization, a file structure containing few folders for development can be found out. Contracts are written in the `contracts` folder while contract deployment settings goes in `migrations`.

2. The `Shopping.sol` contract

   This repository contains a contract showcasing the functioning of a shop or a mall with simple featuress like stock management, item bought and money transfer.

   To get the code you can visit the `Shopping.sol`
   present in the `contracts` folder. You can directly copy the code and paste it in your truffe file structure. Or, you can consider cloning the whole repository.

   ```sh
   >git clone https://github.com/Detroit2077/ETH-AVAX-Module-1.git
   ```

3. Prepare the migration

   `2_deploy_migration.js` in `migrations` folder contains the following code:

   ```js
   const Shopping = artifacts.require("Shopping");
   module.exports = function (deployer) {
     deployer.deploy(Shopping);
   };
   ```

   In case you are creating your own contract just make sure to change all the occurence of the contract name with you choice.

4. Start Truffle console in development mode

   ```bash
   truffle console
   ```

   In the Truffle console, execute

   ```bash
   compile
   migrate
   ```

   If you want to remigrate existing contracts, run `migrate --reset` instead of simply `migrate`.

5. Test your contract

   ```
   To track all the activity in the contract with every function calling you can use Ganache GUI.
   ```

   To use Ganache under the `truffle-config.js` uncomment the network section and edit the following:

   ```js
   development: {
     host: "127.0.0.1",
     port: 7545,
     network_id: "*",
   },
   ```

   _Now Get the Deployed Contract Instance through_

   ```javascript
   const shopping = await Shopping.deployed();
   ```

   This command retrieves the deployed instance of `Shopping`.

   _Add a items to stock_

   ```javascript
   await shopping.selectingItems("123rd", 5, 10);
   ```

   This command calls the function which is in the contract to add items in shop stock.

   _Buy Items_

   ```javascript
   await shopping.buyingItems(5, { value: 30 });
   ```

   This calls the `buyingItems` function which monitor the items and update them with every purchase

   _Transaction_

   ```javascript
   await shopping.withdrawingCurrency();
   ```

   This call the `withdrawingCurrency` function which is resposible transaction between customer and shop.
