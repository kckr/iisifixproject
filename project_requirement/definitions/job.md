# Job
Created when QR is `accepted`

## Definition of Hotness of the job
 - It still requires user's interventions
 - There is still something to be done/reviewed by the user
 - Status of the Job can still be changed to something else
 - **Example**: job at state `done` can be confirmed by VO and moved to `Confirmed`

  
## Statuses
- **pending**
  - Actor: `Vehicle Owner`
  - **Condition**: Whenever new QR is accepted, new job is created with `Pending` status.
- **cancelled**
  - **Actor**: `Garage Owner`
  - **Condition**: QR is `pending`
  - GO can cancel the job if it is `pending`. Already started jobs cannot be cancelled.
- **doing**
  - **Actor**: `Garage Owner`
  - **Condition**: QR is `pending`
  - For any pending, when time comes, Garage Owner  marks the job as `doing` clicking `start` button
- **done**
  - **Actor**: `Vehicle Owner`
  - **Condition**: QR is `doing`
  - When the job is completed, GO marks it as `done` so that VO can confirm the done job.
- **confirmed**
  - **Actor**: `Vehicle Owner [VO]`
  - **Condition**: QR is `done` 
  - **Overview**: If job is marked `done` by the GO, the job done is confirmed by VO.
