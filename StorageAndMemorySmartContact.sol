// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageAndMemoryExample {
    // State variable (storage)
    string public storedString;
    uint256[] public storedNumbers;
    
    // Mapping of user addresses to their balances (storage)
    mapping(address => uint256) public userBalances;

    constructor() {
        storedString = "Hello, Solidity!";
    }

    // Function to update the stored string using memory variable
    function updateStoredString(string memory newString) public {
        // `newString` is a memory variable, used only within this function
        storedString = newString; // Assign memory variable to storage variable
    }

    // Function to add numbers to the storedNumbers array using memory array
    function addNumbers(uint256[] memory numbers) public {
        // `numbers` is a memory array, used only within this function
        for (uint256 i = 0; i < numbers.length; i++) {
            storedNumbers.push(numbers[i]); // Adding numbers to the storage array
        }
    }

    // Function to demonstrate use of both storage and memory variables
    function updateUserBalance(address user, uint256 amount) public {
        // Use a memory variable to modify user balance before storing it
        uint256 tempBalance = userBalances[user]; // Load from storage to memory
        tempBalance += amount; // Modify memory variable
        userBalances[user] = tempBalance; // Store updated value back to storage
    }

    // Function that returns a memory copy of the stored numbers array
    function getStoredNumbers() public view returns (uint256[] memory) {
        // Create a memory copy of the storage array
        uint256[] memory numbersCopy = new uint256[](storedNumbers.length);
        for (uint256 i = 0; i < storedNumbers.length; i++) {
            numbersCopy[i] = storedNumbers[i];
        }
        return numbersCopy;
    }

    // Function that modifies a storage variable using a storage reference
    function modifyStoredNumbers() public {
        uint256[] storage numbers = storedNumbers; // Storage reference
        if (numbers.length > 0) {
            numbers[0] = 999; // Modify the first element in the storage array
        }
    }
}
