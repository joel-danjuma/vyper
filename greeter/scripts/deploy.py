from ape import project
from ape import accounts
from ape.cli import get_user_selected_account

def main():
    account = accounts.test_accounts[0]
    account.deploy(project.Greeter)
