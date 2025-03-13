const fs = require('fs');
const filePath = 'budget.txt';

// 1. Create the file if it doesn't exist
fs.open(filePath, 'a', (err, fd) => {
    if (err) {
        console.error('Error opening file:', err);
    } else {
        console.log('File opened successfully');
        fs.close(fd, () => console.log('File closed'));
    }
});  

// 2. Function to add a transaction
function addTransaction(type, amount) {
    const transaction = `${type}: ₹${amount} - ${new Date().toLocaleString()}\n`;
    fs.appendFile(filePath, transaction, (err) => {
        if (err) console.error('Error writing to file:', err);
        else console.log('Transaction added successfully');
    });
}

// 3. Function to read transactions
function readTransactions() {
    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) console.error('Error reading file:', err);
        else console.log('Budget Transactions:\n', data || 'No transactions yet.');
    });
}

// Example Usage:
addTransaction('Income', 1000);
addTransaction('Expense', 200);

setTimeout(() => {
    readTransactions();
}, 1000);  // Delay to ensure file writes complete
