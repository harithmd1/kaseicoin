pragma solidity ^0.5.5;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
//contract KaseiCoinCrowdsale { // UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
//    constructor(
        // YOUR CODE HERE!
//    ) public Crowdsale(rate, wallet, token) {
        // constructor can stay empty
//    }
//}

/*
contract KaseiCoinCrowdsaleDeployer {
    // Create an `address public` variable called `kasei_token_address`.
    // YOUR CODE HERE!
    // Create an `address public` variable called `kasei_crowdsale_address`.
    // YOUR CODE HERE!

    // Add the constructor.
    constructor(
       // YOUR CODE HERE!
    ) public {
        // Create a new instance of the KaseiCoin contract.
        // YOUR CODE HERE!
        
        // Assign the token contract’s address to the `kasei_token_address` variable.
        // YOUR CODE HERE!

        // Create a new instance of the `KaseiCoinCrowdsale` contract
        // YOUR CODE HERE!
            
        // Aassign the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        // YOUR CODE HERE!

        // Set the `KaseiCoinCrowdsale` contract as a minter
        // YOUR CODE HERE!
        
        // Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role.
        // YOUR CODE HERE!
    }
}
*/
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        KaseiCoin token
    )
      Crowdsale(rate, wallet, token)
      public
    {
        // constructor can stay empty
    }
}

contract KaseiCoinCrowdsaleDeployer {
    address public kaseicoin_token_address;
    address public kaseicoin_crowdsale_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet
    )
    public
    {
        KaseiCoin token = new KaseiCoin(name, symbol, 0);
        kaseicoin_token_address = address(token);

        KaseiCoinCrowdsale kaseicoin_crowdsale =
            new KaseiCoinCrowdsale(1, wallet, token);
        kaseicoin_crowdsale_address = address(kaseicoin_crowdsale);

        token.addMinter(kaseicoin_crowdsale_address);
        token.renounceMinter();
    }
}