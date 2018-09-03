# ISSIFIX
## Business [ Case Studies]
In finland car-owners have to take their cars for inspection annually. (vehicles that are over 5 years old need to go for an annual inspection, and this condition doesn’t necessarily apply to cars that were made during 50s, 60s for example. They have their own set of rules and laws)

**Problem**: 
  - huge Price difference from every garages for ex: EUR 100-500 to repair the same problem.
  s
**Customer’s need**: 
  - Build a platform from where car owner can negotiate the fees; to be able to repair the vehicles at lower cost as possible. Contacting individual garages and describing the problems to each of them could be a tedious process.
  
**Secondary benefit**: 
  - Advertisements for Garages
  - Local search engine for Car/Vehicle owners


## Business Overview

  - What are the user needs, business need and technology capacities?
    - A user needs to be able to find auto repairing services that are affordable and reliable. The process itself should be as less tedious as possible, for example, it saves them time if all the information and fault reporting features were available in the same platform.
  
    - IISIFIX, as a business, needs to address the problems of the majority of vehicle owners in a manner, that is not hefty and complex. A majority of the problems that persists today, involve various factors like time uncertainties, price uncertainties, repair guarantee among others. Although not all of those problems can be expected to be solved with a precise accuracy, we can try to be as specific and straightforward as possible regarding some issues. 
      - **_For example_**, features like live chat with a mechanic or a progress bar can help a user know more on the repair status. Beside this, an addition of fixed-priced services like `Oil change`, `Windshield change`, `tyre change/alignment` etc can help us be more popular among users. Integration of an online calendar for booking services would be a definitive bonus.     

### The first tweet
A Marketplace for Car Owner & Repair Shops.  

Find reliable repair shops in your locality, get quotes, save time and money with **IISIFIX**. 

## Core Feature Overview
  ### Warranty and Payment Options 
  *[In Garage Owner's Dashboard -> garage Profile]*
  >warranty and payment options solely depend on the individual workshops. Some accept 
  only cash whereas some accept pretty much all form of payments, including cash, 
  bank cards, invoicing, installment plans and some also accept the payment from the 
  insurance company. So, it's better to leave these attributes to the workshops 
  themselves. As far as the warranty is concerned, it depends on several factors 
  like service type, up to certain mileage after the repair. 
  >
  >So, It's better to 
  leave these factors to be decided upon by the workshop themselves.
  - Roshan
  
  >After car is repaired vehicle owner must make payment to workshops/garages in 
  offline mode. Payment options accepted by workshops can be: Cash, debit card, 
  American express, Diners club, Installment and etc.   
  Warranty- Workshops provides warranty of their work. Two options: Months and KMs. 
  - Thaman

## FAQs
1. description of the system's architecture (picture, graph or verbal explanation)
  - IISIFIX is a kind of Business to Customer platform where we connect Vehicle Owner with
  mechanical issues with Solution Experts [Garages/Workshops].
  - link to 
  - what information systems are used for the production of the service?
    - **Ans**: 
        - Language: `Ruby` with `Rails` Framework
        - Database: `PostgreSQL`
        - NGINX as Web Server
        - HTTPS for secured browsing with Certificate from authorized vendor

2. descriptions of the user interface and information security. 
 - **Ans** Regarding Information security, proper authentication and authorization is implemented inside the software.
   that means, one can only see his data and other's only if authorized.
 - describe the security principles, including, at least the following:
     - Information Security control system
        - Database administration and security
            - **Ans**: Database access is only available to the `Super Admin` of the software 
     - Personnel information security
        - Only PasswordHash/Encrypted password is stored in the system.
        - securing the connections that goes through trafi's interface
        - We will be using `SSL` to encrypt the socket connection between Iisifix and Trafi
     - User interface administration
        - **Ans** Not sure what that means
     
     - Administration of physical interface
        - **Ans** Not sure what that means


## Technical Explanation
You might encounter with some amazing and unknown code-implementation in this code base. 
 Some of them which might astonish you are listed below
- In `User` model `store` is used
  - `store :metadata, accessors: [:temp_password]`
  - Store gives you a thin wrapper around serialize for the purpose of storing hashes in a 
    single column. It's like a simple key/value store baked into your record when you don't care about being 
    able to query that store outside the context of a single record.
  - see http://api.rubyonrails.org/classes/ActiveRecord/Store.html
  - > Note: Do not use `, coder: JSON` suffix; it won't work in our case.
- For `Array` fields in Postgres see 
  - http://edgeguides.rubyonrails.org/active_record_postgresql.html#array
### Oauth setup in google

The callback urls should be like

### Services Implementations
All the mainly used services are marked as `approved` in `seeds.rb`. Other non-approved services are later added by the garages in their profile.
**Admin can however approve them from the Admin panel and make them available to all the Garages while they try to update their profile.**

### Phone number format
The format in finland is `+358-442105570`.
Only 9 digits. If i call within Finland then it will be 10 digits `(0442105570)`
```
http://iisifix.fi/auth/google_oauth2/callback
```

### Deployments
- `Capistrano` is being used to deploy the software

### Server Monitoring
- `Monit` is used to monitor applications
```
website: http://iisifix.fi:2812/
username: monit
password: ***giri
```

### System Architecture Description
Iisifix system is developed on top of Rails Framework version 5.0. 

### Running Development Machine
To get location from user browser, you need to run server with SSL. try
```bash
$ thin start --ssl
```
For normal operation, Rails will by default run `puma`
```bash
$ rails s
```

Or you can use preloader
```bash
$ zeus start

# in another terminal
$ zeus s
```
   
## Facebook Permissions and data-fields

|**Permission**|**Fields**|
|--------------|----------|
|public_profile|id,name,first_name,last_name,age_range,link,gender,locale,picture,timezone,updated_time,verified|
|user_friends|user_friends|
|email|email|
|user_about_me|bio|
|user_actions.books|
|user_actions.fitness|
|user_actions.music|
|user_actions.news|
|user_actions.video|
|user_actions:{app_namespace}|
|user_birthday|age_range|
|user_education_history|education|
|user_events|events|
|user_games_activity|activity|
|user_groups|groups_edge|
|user_hometown|hometown|
|user_likes|likes edge|
|user_location|location|
|user_managed_groups|Groups edge|
|user_photos|photos edge|
|user_posts|posts|
|user_relationships|relationship status, significant other and family members|
|user_relationship_details|interested_in|
|user_religion_politics|-|
|user_tagged_places|-|
|user_videos|-|
|user_website|website|
|user_work_history|work|
|read_custom_friendlists|-|
|read_insights|-|
|read_audience_network_insights|-|
|read_page_mailboxes|-|
|manage_pages|-|
|publish_pages|-|
|publish_actions|
|rsvp_event|-|
|pages_show_list|-|
|pages_manage_cta|-|
|pages_manage_instant_articles|-|
|ads_read|-|
|ads_management|-|
|business_management|-|
|pages_messaging|-|
|pages_messaging_phone_number|-|
