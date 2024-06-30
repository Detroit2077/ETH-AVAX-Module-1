// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Shopping {
    address public owner;
    string public itemID;
    uint public itemPrice;
    uint public itemQuantity;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can access this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function selectingItems(
        string memory _itmID,
        uint _itmPrice,
        uint _itmQnty
    ) public onlyOwner {
        require(bytes(_itmID).length > 0, "Item ID cannot be empty");
        require(_itmQnty > 0, "Item quantity cannot be zero");
        if (_itmPrice == 0) {
            revert("Item price cannot be zero");
        }

        itemID = _itmID;
        itemPrice = _itmPrice;
        itemQuantity = _itmQnty;
    }

    function buyingItems(uint _itmQnty) public payable {
        if (_itmQnty > itemQuantity) {
            revert("Insufficient quantity");
        }
        require(msg.value >= itemPrice * _itmQnty, "Insufficient funds");

        itemQuantity -= _itmQnty;
    }

    function withdrawingCurrency() public onlyOwner {
        bool CurrencyReceived;
        uint balance = address(this).balance;
        require(balance > 0, "Insufficient balance");

        if (payable(owner).send(balance)) {
            CurrencyReceived = true;
        } else {
            CurrencyReceived = false;
        }
        assert(CurrencyReceived);
    }
}
