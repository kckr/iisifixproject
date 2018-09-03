> **Note**: This application supports multiple languages so, we expect the test suite to be in **English** mode.

# User Stories
  Along with **Acceptance Tests**

## Table of Contents
<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [User Stories](#user-stories)
	- [Table of Contents](#table-of-contents)
- [Static Pages](#static-pages)
	- [Home Page](#home-page)
	- [About Us Page](#about-us-page)
	- [Contact Us Page](#contact-us-page)
	- [Terms and Condition popup](#terms-and-condition-popup)
	- [Style Guide](#style-guide)
- [Authentication / Registration](#authentication-registration)
	- [Sign In](#sign-in)
		- [Garage Owner {**GO**}](#garage-owner-go)
		- [Vehicle Owner {**VO**}](#vehicle-owner-vo)
		- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
	- [Forgot your password?](#forgot-your-password)
		- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
	- [Remember Me](#remember-me)
		- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
	- [Sign Up](#sign-up)
		- [Overview](#overview)
		- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
		- [Email address confirmation [after filling quote request form]](#email-address-confirmation-after-filling-quote-request-form)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
- [Vehicle Owner](#vehicle-owner)
	- [Search Feature](#search-feature)
		- [Overview](#overview)
		- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
	- [Quotation Request](#quotation-request)
		- [Create Quotation Request workflow/Feature](#create-quotation-request-workflowfeature)
			- [Overview](#overview)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
		- [View Quotes requests details page](#view-quotes-requests-details-page)
		- [Listing of biddings/Quote Requests in dashboard](#listing-of-biddingsquote-requests-in-dashboard)
		- [Update Quotation Request workflow/Feature](#update-quotation-request-workflowfeature)
		- [Withdraw/cancel [only the Pending quotation request]](#withdrawcancel-only-the-pending-quotation-request)
			- [Acceptance Criteria / Test cases [in Bidding lists page]](#acceptance-criteria-test-cases-in-bidding-lists-page)
			- [Acceptance Criteria / Test cases [In quote request show page]](#acceptance-criteria-test-cases-in-quote-request-show-page)
		- [Accepting the Quotation](#accepting-the-quotation)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
		- [Rejecting the Quotation](#rejecting-the-quotation)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
		- [Downloadable/View able Katsastus PDF or Images and General report](#downloadableview-able-katsastus-pdf-or-images-and-general-report)
		- [See number of Unseen Comments in Biddings Page](#see-number-of-unseen-comments-in-biddings-page)
			- [Overview](#overview)
	- [Jobs](#jobs)
		- [Cancellation of Pending Jobs](#cancellation-of-pending-jobs)
			- [Acceptance Criteria / Test cases [in Jobs lists page and show page]](#acceptance-criteria-test-cases-in-jobs-lists-page-and-show-page)
		- [Confirm the Done Job](#confirm-the-done-job)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
		- [Downloadable/View able Katsastus PDF or Images and General report](#downloadableview-able-katsastus-pdf-or-images-and-general-report)
		- [See number of Unseen Comments in Jobs list Page](#see-number-of-unseen-comments-in-jobs-list-page)
		- [Overview](#overview)
	- [Downloadable/Viewable Katsastus PDF or Images and General report](#downloadableviewable-katsastus-pdf-or-images-and-general-report)
- [Garage Owner](#garage-owner)
	- [Garage Profile](#garage-profile)
		- [Garage Public Profile](#garage-public-profile)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
		- [Garage Public Profile Update](#garage-public-profile-update)
		- [Services](#services)
		- [See Services lists](#see-services-lists)
			- [Update Services](#update-services)
			- [Update Supported Vehicles Vendors](#update-supported-vehicles-vendors)
			- [Additional Services [CRUD]](#additional-services-crud)
			- [Fixed Price Services [CRUD]](#fixed-price-services-crud)
		- [Warranty](#warranty)
		- [Payment Options](#payment-options)
	- [Quote Request](#quote-request)
		- [Respond to quote request i.e. Send Quote amount](#respond-to-quote-request-ie-send-quote-amount)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
		- [Ignore the Quote request](#ignore-the-quote-request)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
	- [Jobs](#jobs)
		- [Listing jobs](#listing-jobs)
		- [Mark job as `doing`](#mark-job-as-doing)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
		- [Mark job as `Done`](#mark-job-as-done)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
		- [Request Confirmation](#request-confirmation)
			- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
- [Admin](#admin)
	- [Admin Panel/Dashboard](#admin-paneldashboard)
- [Common tasks](#common-tasks)
	- [Sortable table columns [Every Table]](#sortable-table-columns-every-table)
	- [SMS Notifications](#sms-notifications)
	- [Location Lat-Long finder](#location-lat-long-finder)
	- [Multi-Lingual](#multi-lingual)
	- [Notification bar / Menu](#notification-bar-menu)
		- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
	- [Reminders to complete profile](#reminders-to-complete-profile)
		- [Acceptance Criteria / Test cases](#acceptance-criteria-test-cases)
	- [Commenting on Quote Request](#commenting-on-quote-request)
		- [Acceptance Criteria](#acceptance-criteria)
	- [Commenting on Job page](#commenting-on-job-page)
		- [Acceptance Criteria](#acceptance-criteria)

<!-- /TOC -->

--------------------------------------------------------------------

# Static Pages
## Home Page
  **User Story**:
  As a User [VO/GO] I should be able to see a landing/home page so that I can crawl and see what is this site about.

## About Us Page
  **User Story**:
  As a User [VO/GO] I should be able to see a About US page so that I can crawl and see what is this site about.

## Contact Us Page
  **User Story**:
  As a User [VO/GO] I should be able to see a Contact US page so that I can contact the business people if ISSIFIX.

## Terms and Condition popup
  **User Story**:
  As a user I should be able to see Terms and condition pop when ever I click on "Terms and Condition" link so that I could agree after reading that document.
  
## Style Guide
**User Story**
Maintain Style Guide for back end

--------------------------------------------------------------------

# Authentication / Registration
## Sign In

### Garage Owner {**GO**}
  **User Story**:
  As a **GO** I should be able to login to my dashboard so that I can review
  quotes and do other stuffs.

### Vehicle Owner {**VO**}
  **User Story**:
  As a **VO** I should be able to login to my dashboard so that I can review 
  quotes and do other stuffs.

### Acceptance Criteria / Test cases
```ruby 
Feature: Sign In / Log in : Garage Owner [Creds] successfully logs in
  Garage Owner should be able to login if login creds are correct
  Should not be able to login if any of the creds is incorrect
  Creds are case-senstitive
  Should be able to signin using creds or via OminiAuth [Facebook, Google Plus]
  
  Scenario: Email/Password Login
    Given the user is on Login Page
    And puts creds on "Email" and "Password" fields
    When the user clicks on "Login" button
    Then should be logged in to Dashboard 
    
  Scenario: Facebook / g+ SignIn
    Given User is Vehicle Owner
    Given the user is on Login Page
    When user clicks on "Sign In With Facebook"
    Then should be logged in to Dashboard as a facebook user
      But should let Garage owner let in via Social Media
     
  Scenario: Invalid login attempts
    Given The user is on login page
      And inputs wrong creds
    When the user clicks on "Login" button
    Then should not be logged in to Dashboard
      And redirected to the sign in page with error message in general.
```

## Forgot your password?
  **User Story**:
  As a user I should be able to recover my account even when I forget my password using my registered email address. So that I can continue my work or business.

### Acceptance Criteria / Test cases
```ruby
describe 'Forgot your password?'
  specify 'User is at Sign In / Login page'
  specify 'There is a link called "Forgot your password?"'
  
  context 'when clicked "Forgot your password?" link'
    it 'should redirect the user to password reset page'
    specify 'the page should have email field'
    
    context 'When clicked on "Send password reset link to email" button'
      context 'When Valid email address'
        it 'should send password confirmation link to the email address'
      context 'When Invalid email address'
        it 'should render back to the former page'
        it 'should display with validation error messages /invalid email address/'

context 'Password reset link in email is clicked'
  it 'should take the user to password reset form'
  specify 'There should be "New Password" field'
  specify 'There should be "Password Confirmation" field'
  
  context 'When "update" button is clicked'
    it 'should reset the password of that user'
    it 'should redirect the user to sign in page'
    it 'should display the flash message /Password successfully reset/'
```
  
## Remember Me
  **User Story**:
  As a user I want browsers to remember me so that I dont have to put email and password every now and then.

### Acceptance Criteria / Test cases
```ruby
describe 'Remember me'
  specify 'User is at login page'
  specify 'checkbox "remember me" is checked'
  
  context 'When "Sign In" button is clicked'
    it 'should make the browser remember the user session' 
```

---

## Sign Up
  
### Overview
**User Story**: 
As a user I should be able to sign up into the system. Either via Social Media sites or email.

### Acceptance Criteria / Test cases
```ruby
describe 'Sign Up'
  # Pre-conditions
  specify "there should be two radio buttons viz 'I am a vehicle Owner' and 'I am a Garage Owner'"
  specify "There should be a text field for email address"
  specify "There should be buttons for signup with /social media/"
  specify 'There should be a link saying /I already have an account/'
  
  context 'when user clicks the "Signup" button'
    context 'Success'
      it 'should send a confirmation email to the signing user'
      it 'should display a confirmation flash message saying "email has been sent"'
      it 'should redirect the user to the /sign up/ page'
      it 'should have the /resend confirmation email/ button'
      
    context 'failure'
      context 'Validation check fails'
        context 'Email uniqueness validation'
          it 'should render the sign up page with error message'
          it "should have the message /email address already taken/ in rendered signup page"
        context 'email format validation; a valid email address'
          it 'should render the sign up page with error message'
          it 'should display the message /invalid email address/ in signup page'
  
  context 'When link saying /I already have an account/ is clicked'
    it "should take the user to /login/ page"
   
  context 'As a Vehicle Owner'
    it 'should let me signup via social media
'
  context 'As a garage owner'
    it 'should not let me signup via social media'

```
**Reason Behind Blockage from Social SignUp for Garage Owner**: 
> Well, most garages have their own business contact email address. If garage/repair shop 
 is own by a single person and making them login using social makes sense, but it will 
  complicate things.  
>
>In this kind of two parties login/signup use case I have seen most of the companies 
using this approach. Even our competitors from UK does same. Please have a look signup
 page of whocanfixmycar.com    
https://www.whocanfixmycar.com/signup  
> - Thaman

### Email address confirmation [after filling quote request form]
**User Story**
As a User I should be able to confirm my email address I used to signup into ISSIFIX
#### Acceptance Criteria / Test cases
```ruby
describe 'Confirmation of email address'
  context 'When user clicks the confirmation link in the email'
    it 'should confirm the email address'
    it 'should send the unconfirmed/not_sent quote requests of that user to the garages'
    it 'should send an SMS with details[accepting link, Decline link] to the Garage(s)'
````

---------------------------------------------------------------------------------------

# Vehicle Owner

---------------------------------------------------------------------------------------

## Search Feature
**User Story**:
As a user[(not)logged in] I should be able to search garages nearby or using any search criteria so that I can choose any of them to send `Quote Request`.
- Vehicle Owner is going to see "Search bar" in every page  

### Overview
Landing page will basically let a user to search a workshop in their locality with keywords like postal code or city name, as shown in Fig.1. 

A user can proceed to service request using either postal code or city name. After that, it will lead the user to a search result page.

There will be option to select booking available within (dropdown options: 1 day, 2 days, 3 days, a week and a month).

### Acceptance Criteria / Test cases
```ruby
describe 'Search feature'
  # Pre-conditions
  # Data must be set inside database already
  specify 'there should be a search textbox'
  specify 'there should be a range selector horizontal scroll bar'
  
  specify 'there should be a dropdown where user can select the urgency of the request'
  specify 'there should be /[1 day, 2 days, 3 days, a week and a month]/ as options in drop down'
  
  specify 'there should be a "Search" button'
  
  # ---
  context 'When "Search" button is clicked'
    # Preconditions
    specify 'User filled the text box with "Janak Garage"'
    specify 'User scrolled the slider to values from 10KM to 20KM'
    specify 'User selected the "with In" dropdown to /a week/'
    specify 'There should be "share" button on every Garage record displayed'
    
    # ---
    context '"Should Have"s'
      it 'should take the user to search listing page'
      it 'should display results of garages ranging from 10KM to 20KM only'
      it 'should list out the garages with vacant appointment for a week i.e. next 7 days'\
         'i.e. job is supposed to start and end by next 7 days'
    
    # ---
    context '"Should not have"s'
      it 'should display results of garages ranging other than from 10KM to 20KM only'
      it 'should not list out the garages with non-vacant appointment for next 7 days'
    
    context 'Array icon beside Search text box [for getting user location]'
      it 'should fill the lat/long from the browser into the search text box'
      
    # ---
    context 'When "View full Profile" link on a garage record/row is clicked'
      it "should take the user to garage's profile page"
      
    # ---
    context 'When "Request Quote for selected" button is clicked'
      it 'should take the user to "Request generation form"'
      it 'should auto list the names of the selected garages on the right-side of the tabbed views'
      it 'should make sure no extra[non selected] garages is listed in next page'
```

## Quotation Request
### Create Quotation Request workflow/Feature
**User Story**:
As a vehicle owner I should be able to file a Quotation request to as much Garages/Workshops nearby to get my vehicle repaired.

#### Overview
**Customer’s need**: Build a platform from where car owner can negotiate the fees; to be able to repair the vehicles at lower cost as possible. Contacting individual garages and describing the problems to each of them could be a tedious process.

#### Acceptance Criteria / Test cases

```ruby
specify 'User must be coming from search pages'
specify 'User must be at Request creating workflow page'
specify 'User must have selected some garages'

it 'should have text /Repair your car in just 2 steps/ displayed'
it 'should display detail of all the garages selected'

context 'Step 1'
  context 'User remembers Car/vehicle Reg Number'
    context 'Valid'
      it 'should validate the reg number'
    context 'Invalid'
      it 'should display validation error message'
  
  context 'User does not remember Car/Vehicle Reg Number'
    describe 'should display relevant fields where user can input data'
      it 'should display Car Built Year field'
      it 'should display Car Brand field'
      it 'should display Car Model field'
      it 'should display Car Mileage field'
    
context 'Step 2'
  specify 'There should be checkbox with text "have no katsastus report"'
  specify 'There should field to write additional info to whole request'
  specify 'There should be checkbox for agreeing Terms and Conditions regarding'\
          'katsastus with text /I agree T&C while uploading Katsastus report/'
  specify 'There should be checkbox for agreeing Terms and Conditions for quote request'\
          ' with text /I agree T&C for requesting quote./'
  specify 'should display the urgency info; as selected by the user while searching'\
          ' text to be  shown is /Vehicle to be fixed with in 1 week/'
  
  context 'User has Katsastus report in PDF or JPG format'
    it 'should allow user to upload the file'
    it 'should not make user to input other details'
    it 'should validate the file types and prompt user accordingly'
    
  context 'User has no such report/ its a general services quote request'
    describe 'Problem explaination fields'
      specify 'There should be fields to select services displayed'
      specify 'There should be fields to input additional services with description'
      
  context 'Email field'
    context 'Already logged in'
      it 'should not display the field to input "email"'
    context 'not logged in'
      it 'should display the field to input "email"'
  
  # --- Form Submittion ---
  context 'When clicking "Request Quote from selected Garage(s)"'
    context 'When User is Already logged In'
      it 'should redirect the user to their dashboard'
      it 'should display flash message with text '\
         '/successfully created request and has been sent to the garage(s)/'
      
      it 'should send an SMS with details[accepting link, Decline link] to the Garage(s)'
            
    context 'When User is not logged In'
      context 'Email provided belongs to already existing user'
        it "should redirect to login page with pre-filled email"
        it 'should display flash message with text '\
           '/successfully created request and has been sent to the garage(s)/'
        it 'should send an SMS with details[accepting link, Decline link] to the Garage(s)'
    
     context 'Email provided does not belong to already existing user'
      it 'should display flash message with text '\
         '/successfully created request but not sent to garage(s)/'\
         'please confirm your email'
      it 'should send a confirmation email with link to confirm'
      it 'should not send any SMS to garage(s) until email is confirmed'
      
````
### View Quotes requests details page
**User Story**: 
As a **VO** I should be able to see the details[Show page] of every requests I send to the Garages.

### Listing of biddings/Quote Requests in dashboard
**User Story**: 
As a **VO** I should be able to see the list of all of my Quote requests under "bidding" tab
 so that I could take necessary actions on them.
   
### Update Quotation Request workflow/Feature
> **Currently this feature is not available, users have to sort this out via communication channel**

### Withdraw/cancel [only the Pending quotation request]
**User Story**: 
As a vehicle owner I should Only be able to cancel/withdraw `pending` requests. 
Requests in other state are not allowed to be cancelled by **VO**; these however can be
 rejected by the **Garage Owner**
 
#### Acceptance Criteria / Test cases [in Bidding lists page]

```ruby
describe 'Cancel Pending Quote requests'
  specify 'User is at "Biddings page in dashboard"'
  specify '"Cancel" link is only on the pending requests'
  
  context 'When "Cancel" link is clicked'
    it 'should show a pop with title "Do you wish to cancel the request?"'
    context 'When "Yes" button on popup is clicked'
      it 'should cancel the quote request'
      it 'should redirect the user to biddings page'
    
    context 'When "No" button on popup is clicked'
      it 'should hide the popup'
```

#### Acceptance Criteria / Test cases [In quote request show page]
```ruby
describe 'Cancel Pending Quote requests'
  specify 'User is at "In quote request show page in dashboard"'
  specify '"Cancel" link is present in the page'
  
  context 'When "Cancel" link is clicked'
    it 'should show a pop with title "Do you wish to cancel the request?"'
    
    context 'When "Yes" button on popup is clicked'
      it 'should cancel the quote request'
      it 'redirect the user to Quote Requests listing page'

    context 'When "No" button on popup is clicked'
      it 'should hide the popup'
```

### Accepting the Quotation
**User Story**: 
As a **VO** I should be able to accept the quotation marked by the Garage so that I can start doing business with the garage.

#### Acceptance Criteria / Test cases
```ruby
describe 'Accepting Quotation'
  specify 'User is at requests listing page or request show page or an SMS link'
  specify 'User is a vehicle owner'
  
  context 'When user clicks the Quotation Accepting link'
    it 'should display a popup with title /Are you sure you want to accept this Quote/'
    
    context 'When "yes" button is clicked'
      it 'should mark the request as accepted'
      it 'should notify the garage via SMS and Email'
      it 'should reload the page/redirect to job listing page'
      it 'should display a flash message '\
         '/Quotation successfully accepted, Job has been created'
      specify 'User should see the newly created job linked to very Quote Request'
    
    context 'When "no" button is clicked'
      it 'should hide the popup'
```

### Rejecting the Quotation
**User Story**: 
As a **VO** I should be able to Reject the quotation marked by the Garage so that I can continue focus on other stuff.

#### Acceptance Criteria / Test cases
```ruby
describe 'Rejecting Quotation'
  specify 'User is at requests listing page or request show page or an SMS link'
  specify 'User is a vehicle owner'
  
  context 'When user clicks the Quotation Rejecting link'
    it 'should display a popup with title /Are you sure you want to reject this Quote/'
    
    context 'When "yes" button is clicked'
      it 'should mark the request as rejected'
      it 'should reload the page/redirect to request listing page/bidding page'
      it 'should display a flash message '\
         '/Quotation successfully rejected, moved to archive.'
         
      specify 'User should see the request in archive section in bidding page'
    
    context 'When "no" button is clicked'
      it 'should hide the popup'
```

### Downloadable/View able Katsastus PDF or Images and General report
**User Story**: 
As a **VO** I should be able to download/view the PDF report from the list of QuoteRequests.
  

### See number of Unseen Comments in Biddings Page
**User Story**: 
As a **VO** and **GO** I should be able to see number of unseen comments for that Quote 
request so that I can follow up the conversation.
#### Overview
- In the list of quote requests, **Vo** will see small comment icon under `Status` column 
beside `pending`/`responded` with number of comments the **VO** has not read yet.
- The conversation feature will be blocked when the QR is `accepted`, `rejected`, 
`withdrawn`, `expired`, `cancelled`

---------------------------------------------------

## Jobs
### Cancellation of Pending Jobs 
**User Story**: 
As a vehicle owner I should be able to cancel`pending` jobs only. 

Jobs in other state are not allowed to be cancelled by **VO**; these however can be
 rejected by the **Garage Owner**

#### Acceptance Criteria / Test cases [in Jobs lists page and show page]

```ruby
describe 'Cancel Pending Jobs'
  specify 'User is at "Jobs page in dashboard"'
  specify '"Cancel" link is only on the pending jobs'
  
  context 'When "Cancel" link is clicked'
    it 'should show a pop with title "Do you wish to cancel the job?"'
    context 'When "Yes" button on popup is clicked'
      it 'should mark the job as cancelled'
      it 'should send a notification sms & email to Garage'
      it 'should redirect the user to jobs listing page'
    
    context 'When "No" button on popup is clicked'
      it 'should hide the popup'
```

### Confirm the Done Job
**User Story**: 
As a user / VO I should be able to mark the jobs marked by garage as "Done" as "Confirmed" so that I could close the deal.

#### Acceptance Criteria / Test cases
```ruby
describe 'Confirm the job marked by garage as DONE'
  specify '"Confirm" action is visible in Jobs marked as "Done"'
  specify 'User is at jobs listing page or job show page'
  
  context 'When "Confirm" button is clicked'
    it 'should display a popup with title /Confirm Job Done/'
    it 'should have a checkbox with label /Would love to post review/ checked already'
    it 'should have rating stars'
    it 'should have "company name" field'
    it 'should have "Position" field'
    it 'should have "How did you feel working with this garage" field'
    
    context 'When "Confirm Done!" button is clicked'
      it 'should mark the job as confirmed'
      it 'should send an SMS, EMail to garage about confirmation'
      it 'should disable the conversation section for that job'
      it 'should redirect the user to jobs listing page'
      it 'should have that job in archive seciton'
```


### Downloadable/View able Katsastus PDF or Images and General report
**User Story**: 
As a **VO** I should be able to download/view the PDF report from the show page of any Jobs.

### See number of Unseen Comments in Jobs list Page
**User Story**: 
As a **VO** and **GO** I should be able to see number of unseen comments for that jobs so that I can follow up the conversation.
### Overview
- In the list of quote requests, **Vo** will see small comment icon under `Status` column beside `pending`/`doing` with number of comments the **VO** has not read yet.
- The conversation feature will be blocked when the Job is `confirmed`, `Done`, `expired`, `cancelled`

## Downloadable/Viewable Katsastus PDF or Images and General report
**User Story**: 
As a **GO** I should be able to download/view the PDF report from the list of QuoteRequests.

------------------------------------------------------------------------
------------------------------------------------------------------------

# Garage Owner
## Garage Profile
### Garage Public Profile
**User Story**: 
As a Garage I should have and able to see a public profile of mine so that I can extend my business.

#### Acceptance Criteria / Test cases
```ruby
describe 'See garage Public profile'
  context 'When I click "Show Profile" button'
    it 'should take me to "Garage Public profile" page'
    
    it 'should have a cover photo'
    it 'should have a organization logo photo'
    it 'should show ratings'
    it 'should show Reviews'
    it 'should show Services [fixed rates as well]'
    it 'should show my map'
```

### Garage Public Profile Update
**User Story**: 
As a Garage I should be able to update my profile information so that my public profile 
would look good.

### Services
### See Services lists
**User Story**
As a Garage I should be able to set all the services I provide so that my customers domain would increase. Along with services I should also be able to List out Vehicles we 
have knowledge of. We would also like to support some additional services from main stream.

#### Update Services
**User Story**
As a GO I should be able to update service we support.

  #### Acceptance Criteria / Test cases
  ```ruby
  describe 'Set services available in garage'
    specify 'GO is at "Services" tab in profile page in dashboard'
    specify 'GO sees Collapsible tabs of all system supported services checkboxes'
    specify 'GO should be able to check the boxes'
    
    context 'When "Update Now!" button is clicked'
      it 'should update the services for that Garage'
      it 'should redirect the GO to their profile page'
      it 'should display flash message /Services successfully updated/'
  ```

#### Update Supported Vehicles Vendors
**User Story**
As a GO I should be able to update supported vehicle vendors so that I can choose which vehicle we are capable of repairing
  #### Acceptance Criteria / Test cases
  ```ruby
  describe 'Update Supported Vehicles Vendors'
    specify 'GO is at "Services" tab in profile page in dashboard'
    specify 'GO sees vehicle vendor checkboxes'
    specify 'GO should be able to check the boxes'
    
    context 'When "Update Now!" button is clicked'
      it 'should update the Vehicles supported for that Garage'
      it 'should redirect the GO to their profile page'
      it 'should display flash message /Services successfully updated/'
      specify 'GO should be able to see updated Vehicle vendor list'
  ```

#### Additional Services [CRUD]
**User Story**
As a GO I should be able add Services we support but not in the system-provided list.

  #### Acceptance Criteria / Test cases
  ```ruby
  describe 'Additional Services [CRUD]'
    specify 'GO is at "Services" tab in profile page in dashboard'
    specify 'GO sees "Additional Services" section'
    specify 'GO see "name of the service" field'
    specify 'GO see "Service Description" field'
    specify 'GO see "Service Category" field to put the lable on service'
    specify 'GO see "+ Add new" button to add some more services'
    
    context 'When "Update Now!" button is clicked'
      it 'should add new service to selected category for that garage only'
      it 'should redirect the GO to their profile page'
      it 'should display flash message /Services successfully updated/'
      specify 'GO should be able to see updated additional services in the list'
  ```

#### Fixed Price Services [CRUD]
**User Story**
As a GO I should be able to put prices to the services we declare as a fixed-price for out Garage
  #### Acceptance Criteria / Test cases
  ```ruby
  describe 'Fixed Price Services [CRUD]'
    specify 'GO is at "Services" tab in profile page in dashboard'
    specify 'GO sees "Additional Services" section'
    specify 'GO see "name of the service" field'
    specify 'GO see "Service Description" field'
    specify 'GO see "Service Category" field to put the lable on service'
    specify 'GO see "+ Add new" button to add some more services'
    
    context 'When "Update Now!" button is clicked'
      it 'should add new service to selected category for that garage only'
      it 'should redirect the GO to their profile page'
      it 'should display flash message /Services successfully updated/'
      specify 'GO should be able to see updated additional services in the list'
  ```

### Warranty
**User Story**: 
As a Garage I should be able to put warranty information description

### Payment Options
**User Story**: 
As a Garage I should be able select from the list of payment methods so that my customers could know which payment options we do support.

--------------------------

## Quote Request
### Respond to quote request i.e. Send Quote amount
**User Story**:
As a **GO** I should be able to respond to quote requests from **VO** so that I can move forward in doing business.

#### Acceptance Criteria / Test cases
```ruby
describe 'Respond to quote request i.e. Send Quote Request'
  specify 'GO is at bidding listing page of dashboard or Quote request show page'
  specify 'there should be "Send Quote" link'
  
  context 'When "send Quote" link is clicked'
    it 'should show a popup'
    specify 'there should be a text field with label "Best price you would offer"'
    specify 'there should be date fields'
    specify 'there should be offered warranty fields with label /Offer warranty for work/'
    
    context 'When "Send Quote Now!" button is clicked'
      it 'should send the Quote to customer / VO'
      it 'should send an SMS to the VO with details '\
         '[Accept and Reject links, warranty info, proposed start-end time '\
         '{appointment date-time}]'
      it 'should send an email to the VO with details '\
         '[Accept and Reject links  warranty info, proposed start-end time '\
         '{appointment date-time}]'
      it 'should take/redirect the user to biddings list page'
    
    context 'When Close(X) button is clicked'
      it 'should hide the popup box'
      
    context 'When "Review Request Detail" link is clicked'
      it 'should take the user to the request detail page'
```

### Ignore the Quote request
**User Story**: 
As a **garage owner**, I should be able to ignore any of the Quote Requests if I think its bogus or I am not interested in so that I would concentrate on important ones.

#### Acceptance Criteria / Test cases
```ruby
describe 'Ignore the Quote request'
  specify 'User is at bidding list page or quote-request show page'
  specify '"Ignore" action is only available in Pending requests'
  
  context 'When I click on "Ignore" action item'
    it 'should display a pop with title /Do you really want to ignore this request?/'
    context 'When "Yes" button clicked'
      it 'should mark the request as "Ignored"'
      it 'should reload the page/change data via AJAX'
      it 'should send a in-app notification'
    context 'when "No" button is clicked'
      it 'should hide the popup'
```

-------------------------

## Jobs

### Listing jobs
**User Story**: 
As a **garage owner** I should be able to see all the jobs in lists. Actually there should be two lists; one for `doing` jobs and other for `done`, `cancelled`, `confirmed` jobs. Title for the later part would be `Archive`

### Mark job as `doing`
**User Story**: 
As a **GO** I should be able to `start` a job to mark it as `doing` to indicate that I have actually started doing this job.

#### Acceptance Criteria / Test cases
```ruby
describe 'Mark job as doing'
  specify '"start" button only appears on "pending" job'
  specify 'user is at "Jobs" or "Job show" page'
  
  context 'When GO clicks "Start" action on table'
    it 'should display a popup with title /Are you sure to start working on the job'
    
    context 'When GO clicks "Yes" button'
      it 'should mark the job as `doing`'
      it 'should send a in-app notification'
      it 'should send email & SMS to VO'
      it 'should reload the page'
      
    context 'When GO clicks "No" button'
      it 'should hide the popup dialog'
```

### Mark job as `Done`
**User Story**: 
As a **GO** I should be able to `close` a job to mark it as `done` to indicate that I have actually started doing this job.

#### Acceptance Criteria / Test cases
```ruby
describe 'Mark job as done'
  specify '"Mark as Done" button only appears on "pending" job'
  specify 'user is at "Jobs" or "Job show" page'
  
  context 'When GO clicks "Mark as Done" action on table'
    it 'should display a popup with title /Are you sure you completed the job?'\
       'This will ask Vehicle Owner to confirm the job done.'
    
    context 'When GO clicks "Yes" button'
      it 'should mark the job as `done`'
      it 'should send a in-app notification to confirm the job'
      it 'should send email & SMS to VO'
      it 'should reload the page'
      
    context 'When GO clicks "No" button'
      it 'should hide the popup dialog'
```

### Request Confirmation
**User Story**: 
As a **GO** I should be able to request for confirmation for a job to indicate that I have actually completed this job.

#### Acceptance Criteria / Test cases
```ruby
describe 'Request Confirmation'
  specify '"Request Confirmation" button only appears on "Done" jobs'
  specify 'user is at "Jobs" or "Job show" page'
  
  context 'When GO clicks "Request Confirmation" action on table'
    it 'should redirect the GO to the show page of the Job; particularly '\
       'to "conversation" section'
    specify 'The "New Comment" text field should be prefilled with'\
            '"Hey, Could you please confirm our work? \n Thanks !!"'
```

-------------------------------------------------------------------
-------------------------------------------------------------------

# Admin

## Admin Panel/Dashboard
As an admin of IISIFIX, I should be able to see and do CRUD operation on all of the Models in the system.

-------------------------------------------------------------------
-------------------------------------------------------------------

# Common tasks

## Sortable table columns [Every Table]
**User Story**: 
As a **VO** or **GO** I should be able to sort all of the table columns both in Ascending or descending order so that I could get the row I am searching for, more easily. 
  
## SMS Notifications
**User Story**: 
As a **GO** or **VO** I should get notified whenever my Quote is responded by the **VO** only if I have accepted to receive SMSes in SignUp confirmation page or from my profile.
>**Note**: They get to choose whether or not to receive SMS notifications from A checkbox in Signup's email Confirmation page and Profile update page in dashboard.

## Location Lat-Long finder
**User Story**:
As a user I should be able to let the app find my Lat-long so that search results would be based on these data.
```ruby
describe 'Location finder'
  specify 'There is arrow icon/button on the page'
  
  context 'when arrow is clicked'
    it 'should read the lat-long from Browser and embed the info in the search form'
```

## Multi-Lingual
**User Story**: 
As a VO/GO I should be able to browser the Software in both `English` and `Finnish` languages. 
  Currencies and other locale information also need attention.

## Notification bar / Menu
**User Story**: 
As a **VO** or **GO** I should be able to see Notifications icon on the top with number of Unread/Unseen notifications. So that I can be notified what I have to do next.

### Acceptance Criteria / Test cases
```ruby
describe 'See Notifications'
  context 'When some events occurs that should be notified of'
    it 'should show the count of events on Notification Icon'
    
  context 'When I click Notification Icon on header'
    it 'should activate a dropdown'
    it 'should show a list of events in descending order by event date-time'
    it 'should shade the unread notifications'
```

## Reminders to complete profile
**User Story**:
As a Garage or vehicle Owner I should be able to see "Profile completion" flash messages so that I could be reminded to complete my profile.

### Acceptance Criteria / Test cases
```ruby
describe 'Reminder to complete profile'
  specify 'User has already signed up'
  specify 'email has already been confirmed'
  
  context 'Everytime user logs in to the dashboard'
    
    context 'All profile information has been provided'
      it 'should not display any reminder'
    
    context 'A few profile information has been provided but not all'
      it 'should display reminder flash message like '\
         '/You profile seems incomplete, please complete you profile '\
         'to get better offer and get noticed./'
```

## Commenting on Quote Request
**User Story**  As a VO/GO I should be able to conversate with GO on every Quote Request page 
so that I can take to quote request to job deal.

### Acceptance Criteria
```ruby
describe 'Commenting feature in QR'
  specify 'The VO/GO is at any of the QR show page'
  specify 'VO/GO sees Conversation section'
  specify 'VO/GO sees "New Comment" text-box'
  
  context 'When VO/GO clicks "Add Comment" button'
    it 'should add the text as a new comment'
```

## Commenting on Job page
**User Story**  As a VO/GO I should be able to conversate with GO on every Quote Request page 
so that I can take to quote request to job deal.

### Acceptance Criteria
```ruby
describe 'Commenting feature in Job'
  specify 'The VO/GO is at any of the Job show page'
  specify 'VO/GO sees Conversation section'
  specify 'VO/GO sees "New Comment" text-box'
  
  context 'When VO/GO clicks "Add Comment" button'
    it 'should add the text as a new comment'
```
