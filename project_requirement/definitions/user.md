
# User

## Statuses
- **unconfirmed**
  - Actor: `Self`
  - **Condition**: When user puts email address and clicks the "SignUp" button in signup form.
- **email_confirmed**
  - Actor: `devise/system`
  - **Condition**: When user clicks the confirmation link in the email.
- **active**
  - **Actor**: `System`
  - **Condition**: When user puts details in confirmation form and agrees to `Terms and Condition`.
- **cancelled**
  - **Actor**: `Self`
  - **Condition**: When the user want to deactivate the account, then from the settings page they click `Cancel my Subscription` button.
