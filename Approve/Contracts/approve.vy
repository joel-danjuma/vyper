# @version ^0.3.0

# Declare a variable 'account' to store an Ethereum address
account : address
# Declare a HashMap called 'approved_accounts' to store the mapping of addresses to their approval status (True or False)
approved_accounts : HashMap[address, bool]

@external
def __init__():
    # Set the approval status of the contract creator to True upon contract deployment
    self.approved_accounts[msg.sender] = True

@external
@nonpayable
def approve_account(_account : address) -> String[30]:
    # Set the approval status of the provided address to True
    self.approved_accounts[_account] = True
    return "Address is approved!"
    
@external
@nonpayable
def is_acc_approved(_account : address) -> bool:
    # Check if the provided address has been approved and return the corresponding Boolean value
    if self.approved_accounts[_account]:
        return True
    else:
        return False

@external
@nonpayable
def revoke_approval(_account : address) -> String[30]:
    # Check if the provided address has been approved, and if so, set its approval status to False and return a message
    if self.approved_accounts[_account] == True:
        self.approved_accounts[_account] = False
        return "Account is no longer approved!"
    else:
        return "Account is not approved"
