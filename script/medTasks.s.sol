// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Script.sol";
import "../src/medTasks.sol";

contract MedTasksScript is Script {
    function run() external {
        vm.startBroadcast();

        vm.stopBroadcast();
    }
}
