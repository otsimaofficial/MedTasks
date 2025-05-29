// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {MedTasks} from "../src/medTasks.sol";

contract MedTasksTest is Test {
    MedTasks medTasks;
    address worker1 = address(0xA1);
    address worker2 = address(0xB2);

    function setUp() public {
        medTasks = new MedTasks();
    }

    function testCreateTask() public {
        vm.prank(worker1);
        medTasks.createTask("PAT123", "Follow-up for blood test");

        MedTasks.Task[] memory tasks = medTasks.getTasksByWorker(worker1);
        assertEq(tasks.length, 1);
        assertEq(tasks[0].patientId, "PAT123");
        assertEq(tasks[0].description, "Follow-up for blood test");
        assertEq(uint(tasks[0].status), uint(MedTasks.Status.Pending));
        assertGt(tasks[0].createdAt, 0);
    }

    function testUpdateTask() public {
        vm.prank(worker1);
        medTasks.createTask("PAT123", "Initial checkup");

        vm.prank(worker1);
        medTasks.updateTask(0, "Updated checkup", MedTasks.Status.Ongoing);

        MedTasks.Task[] memory tasks = medTasks.getTasksByWorker(worker1);
        assertEq(tasks[0].description, "Updated checkup");
        assertEq(uint(tasks[0].status), uint(MedTasks.Status.Ongoing));
    }

    function testDeleteTask() public {
        vm.prank(worker1);
        medTasks.createTask("PAT123", "Delete me");

        vm.prank(worker1);
        medTasks.deleteTask(0);

        MedTasks.Task[] memory tasks = medTasks.getTasksByWorker(worker1);
        assertEq(tasks.length, 0);
    }
}
