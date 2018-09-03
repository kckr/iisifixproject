## Latest QC Date
Sep 19, 2016  
Validation of Feed Remains
### Quote Request Flow
- When `VehicleOwner` **creates** `QuoteRequest`
  - **Email to**:`GarageOwner`
  - **SMS to**: `GO`
    - See `app/controllers/vehicle_owners/confirmations_controller.rb:50`
  - **Notification Feed**: `GO` 
  - **Content**: Details of the problem and link to view details of the `QuoteRequest`.
  - **Condition**: `VehicleOwner` needs to be confirmed user.
  - **QC**: `Pass` - Sep 19, 2016

- When `GarageOwner` **send quote** on `QuoteRequest`
  - **Email to**:`VehicleOwner`
  - **SMS to**: `VO`
    - See `app/controllers/garage_owners/quote_requests_controller.rb:51`
  - **Notification Feed**: `VO`
  - **Content**: Details of the quote sent and link to view details of the `QuoteRequest`.
  - **QC**: `Pass` - Sep 19, 2016

- When `GarageOwner` **ignores** `QuoteRequest`
  - **Email to**:`VehicleOwner`
  - **SMS to**: -
  - **Notification Feed**: `VO`
  - **Content**: Message of ignored and link to view details of the `QuoteRequest`.
  - **Condition**: Make sure if this is required.
  - **QC**: `Pass` - Sep 19, 2016

- When `VehicleOwner` cancels the quote-request
  - **Email to**:`GarageOwner`
  - **SMS to**: -
  - **Notification Feed**: `GO`
  - **Content**: Message of rejected and link to view details of the `QuoteRequest`.
  - **QC**: `Pass` - Sep 19, 2016

- When `VehicleOwner` **rejects quote** on `QuoteRequest`
  - **Email to**:`GarageOwner`
  - **SMS to**: -
  - **Notification Feed**: `GO`
  - **Content**: Message of rejected and link to view details of the `QuoteRequest`.
  - **QC**: `Pass` - Sep 19, 2016

- When `VehicleOwner` **accepts quote** on `QuoteRequest`
  - **Email to**:sender `GarageOwner`
  - **SMS to**: `GO`
    - See `app/controllers/vehicle_owners/quote_requests_controller.rb:63`
  - **Notification Feed**: `GO`
  - **Content**: Informing that job is created and needs to start along with link to job.
  - **QC**: `Pass` - Sep 19, 2016

<!-- Expiration -->
- When `VehicleOwner`'s unattended `QuoteRequest`s are **expired**
  - **Email to**: `VO`
  - **SMS to**: -
  - **Notification Feed**: `VO`
  - **Content**: Informing that `QuoteRequestLot` has expired and the `QuoteRequest` is not valid now.

### Job Flow
- When `VehicleOwner` cancels the `Job`
  - **Email to**:`GarageOwner`
  - **SMS to**: -
  - **Notification Feed**: `GO`
  - **Content**: Informing that the job has been canceled with link to `Job` detail.
  - **QC**: `Pass` - Sep 19, 2016

- When `GarageOwner` starts `Job`
  - **Email to**:`VehicleOwner`
  - **SMS to**: -
  - **Notification Feed**: `VO`
  - **Content**: Informing that the job has been started with link to `Job` detail.
  - **QC**: `Pass` - Sep 19, 2016

- When `GarageOwner` completes the `Job`
  - **Email to**:`VehicleOwner`
  - **SMS to**: `VO`
    - See `app/controllers/garage_owners/jobs_controller.rb:39`
  - **Notification Feed**: `VO`
  - **Content**: Informing that the job has been completed along with guide to confirm it as done linking to `Job` detail.
  - **QC**: `Pass` - Sep 19, 2016

- When `VehicleOwner` confirms the `Job`
  - **Email to**:`GarageOwner`
  - **SMS to**: -
  - **Notification Feed**: `GO`
  - **Content**: Informing that the job completed has been verified by VO.
  - **QC**: `Pass` - Sep 19, 2016
  
## Client Says: 
https://iisifixteam.slack.com/archives/general/p1474269135000101  
theman [12:56 PM]  
Shiva here is a list of events when SMS needs to be sent.

[12:57]  
- When V0 creates QuoteRequest.
    - Covered with Test
- When GO send quote for the QuoteRequest to VO.
    - Covered with Test
- When VO accepts quote on QuoteRequest.
    - Covered with Test
- When GO completes the Job.
    - Covered with Test 
 