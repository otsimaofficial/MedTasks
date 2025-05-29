# 🏥 MedTasks – Decentralized Health Task Manager

MedTasks is a Solidity smart contract built for the healthcare industry to manage and track patient-related tasks on the blockchain. It enables healthcare workers to securely create, view, update, and delete medical follow-up tasks linked to specific patient IDs, promoting **accountability**, **transparency**, and **data integrity** in clinical workflows.

---

🔧 Features

- ✅ **Task Creation**: Add follow-up tasks tied to a patient's unique ID.
- 📋 **Task Management**: View, update, or delete only your own tasks.
- ⏳ **Status Tracking**: Tasks can be `Pending`, `Ongoing`, or `Completed`.
- 🕒 **Timestamps**: Each task records when it was created.
- 🔐 **Access Control**: Only the creator of a task can modify or delete it.
- 📡 **Events**: Emits events on creation, update, and deletion for frontend or audit integration.

---

🧱 Smart Contract Structure

- **Enum**: `Status` defines task state: `Pending`, `Ongoing`, `Completed`.
- **Struct**: `Task` includes `patientId`, `description`, `status`, and `createdAt`.
- **Mapping**: `tasks[address]` stores each user's tasks privately.
- **Functions**:
  - `createTask(...)`
  - `getMyTasks()`
  - `getTasksByWorker(address)`
  - `updateTask(...)`
  - `deleteTask(...)`
- **Events**:
  - `TaskCreated`
  - `TaskUpdated`
  - `TaskDeleted`

---

🛠️ Getting Started

Prerequisites

- [Foundry](https://book.getfoundry.sh/)
- Node.js (for frontend integration, optional)
- MetaMask / Ethereum wallet for deployment

Compile Contract

```bash
forge build

Run Tests
forge test

📁 Project Structure
MedTasks/
├── src/
│   └── MedTasks.sol       # Solidity smart contract
├── test/
│   └── MedTasks.t.sol     # Foundry unit tests
├── script/                # Optional deployment scripts
└── README.md              # Project documentation

🌐 Use Cases
-Hospital systems wanting decentralized task tracking
-Medical teams managing patient care collaboratively
-Auditable patient workflows for clinical follow-ups
-Web3 health dApps needing backend task infrastructure

🧪 Testing
All core functions are covered using Foundry's fast and gas-efficient test framework. See test/MedTasks.t.sol.

📄 License
This project is licensed under the MIT License.

🤝 Contributing
Have ideas to improve MedTasks? Open an issue or submit a PR!
Let's build decentralized healthcare solutions together. 💙

📝 Author
Emmanuel Otsima Ogbu  (https://github.com/otsimaofficial)
For collaboration or frontend integration, feel free to reach out!
Blockchain Developer Cohort – 2025