// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// MedTasks - A decentralized health task manager for patient follow-ups
contract MedTasks {
    enum Status {
        Pending,
        Ongoing,
        Completed
    }

    struct Task {
        string patientId;
        string description;
        Status status;
        uint256 createdAt;
    }

    mapping(address => Task[]) private tasks;

    event TaskCreated(address indexed worker, uint256 taskIndex, string patientId);
    event TaskUpdated(address indexed worker, uint256 taskIndex, Status newStatus);
    event TaskDeleted(address indexed worker, uint256 taskIndex);

    /// medical follow-up task _patientId The patient’s unique ID  _description The task details
    function createTask(string memory _patientId, string memory _description) external {
        tasks[msg.sender].push(
            Task({patientId: _patientId, description: _description, status: Status.Pending, createdAt: block.timestamp})
        );

        emit TaskCreated(msg.sender, tasks[msg.sender].length - 1, _patientId);
    }

    function getMyTasks() external view returns (Task[] memory) {
        return tasks[msg.sender];
    }

    function getTasksByWorker(address _worker) external view returns (Task[] memory) {
        return tasks[_worker];
    }

    function updateTask(uint256 _index, string calldata _description, Status _status) external {
        require(_index < tasks[msg.sender].length, "Invalid task index");
        Task storage task = tasks[msg.sender][_index];
        task.description = _description;
        task.status = _status;

        emit TaskUpdated(msg.sender, _index, _status);
    }

    function deleteTask(uint256 _index) external {
        uint256 length = tasks[msg.sender].length;
        require(_index < length, "Invalid task index");

        if (_index < length - 1) {
            tasks[msg.sender][_index] = tasks[msg.sender][length - 1];
        }

        tasks[msg.sender].pop();

        emit TaskDeleted(msg.sender, _index);
    }
}
