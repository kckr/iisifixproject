# Quote Request

## Statuses
- **not_sent**
  - Actor: `Vehicle Owner`
  - **Condition**: QR should not be at any status prior to this.
  - When a complete new user to the system, desires to send quote request, Quote request is created but not sent. QR is with `not_sent` status.
  - When `VO` confirm their email address, then the `not_sent` QR are marked as `pending`
- **pending**
  - Actor: `Vehicle Owner`
  - Whenever new QR is sent, its `Pending`
- **responded**
  - **Actor**: `Garage Owner`
  - **Condition**: QR is `pending`
  - Garage Owner responds with Quote amount, Warranty info and Start-End date-time.
- **accepted**
  - **Actor**: `Vehicle Owner`
  - **Condition**: QR is `responded`
  - VO accepts the quote on that particular QR if the proposition is acceptable.
- **rejected**
  - **Actor**: `Vehicle Owner`
  - **Condition**: QR is `responded`
  - VO rejects the quote on that particular QR if the proposition is not acceptable.
- **ignored**
  - **Actor**: `Garage Owner`
  - **Condition**: QR is `pending` 
  - **Overview**: if GO thinks the request is bogus or no-point in responding.
- **cancelled**
  - **Actor**: `Garage Owner`
  - **Condition**: QR is `responded`
  - Only applicable when GO has already sent quote but does not want to 
  continue and withdraws the Quotation.
  - i.e. if QR is not at 