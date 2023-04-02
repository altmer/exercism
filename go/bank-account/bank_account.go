package account

import "sync"

const testVersion = 1

// BankAccount represents bank accout
type BankAccount struct {
	amount int
	open   bool
	mutex  *sync.Mutex
}

// Open opens new bank account with specified amount
func Open(amount int) *BankAccount {
	if amount < 0 {
		return nil
	}
	return &BankAccount{amount, true, &sync.Mutex{}}
}

// Balance returns current account balance if account is not closed
func (account BankAccount) Balance() (int, bool) {
	account.mutex.Lock()
	defer account.mutex.Unlock()
	if account.open {
		return account.amount, true
	}
	return -1, false
}

// Close closes current account and returns payout
func (account *BankAccount) Close() (int, bool) {
	account.mutex.Lock()
	defer account.mutex.Unlock()
	if account.open {
		account.open = false
		return account.amount, true
	}
	return 0, false
}

// Deposit adds given amount to the bank account
func (account *BankAccount) Deposit(amount int) (int, bool) {
	account.mutex.Lock()
	defer account.mutex.Unlock()
	if account.open {
		newAmount := account.amount + amount
		if newAmount < 0 {
			return -1, false
		}
		account.amount = newAmount
		return account.amount, true
	}
	return -1, false
}
