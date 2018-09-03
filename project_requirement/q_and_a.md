# Questions and Answers
> **Note** All these questions are asked by Developers to the client.   
> **This doc is well viewed in Github and other markdown views** 

**Dated: Aug 3rd Week, 2016**
1. Context: Players in this game    
   * We thought two parties viz, Garage Owner and Car Owner are gonna signup, But we saw “Driver” and “Mechanic”. Who are they?  Are we going to have these parties too?  
    * **Client**: We will go with “Garage and Car owner terminology”. (How about “workshop”? Might sound a tad more professional)
      * **Dev** In my opinion “Garage owner” and “Car owner” makes more sense.  
2. Context Languages: I18n / Locale  
   * Which languages do we need to support?   
    * **Client**: (FIN//ENG)
   * Details please:  
     * **Time Zone** - UTC+03:00 Eastern European Time Zone  
     * **Currency format** - €200,00 (Two hundred euros), €158,50 (One hundred fifty eight and 50 cents)  
    * **Language** - (FIN/ENG)   
3. How is payment going to be handled?  
   * If this app gonna have Payment Gateways Integrated?  
     * **Client**: 
       * NO need of payment integration in system.  
       * We will send monthly invoice to garages if any car is repaired through their shop.  
       * Our system needs to keep track of car repaired from several garages so it’s possible to bill accordingly. It means we need to have some sort of IISIFIX dashboard.  
   * I think garage owner needs to have some portal to mark the Offers/Bids as accepted and need to be able to mark if payments accepted or due amount On the basis of which report can be generated in future days.  

4. Car Owner > Account > Add your car
   * How would this function in case of repair request?
    * **Client**: 
      * To repair car owners have to mention car model, year of manufacturing, license number, mileage run and etc. (This process can be further simplified, by using the registration number as a search query, and in return, it gives the technical details of the vehicle)
      * If car info is already available then it will somehow speed up repair request.
   * Eligibility to add multiple car? 
     * **Client**: Yes 
5. Would not it be good to have the functionality to search Garages for public users not requiring login at the time? 
   * **Client**: BIG YES, We were thinking of these functionality in the main page like other vertical search (real estate, rent, flight and etc)
6. How would the flow for requesting quote be? WIll the user search for garage and then request for quote to that particular garage only? OR, will the user get to post the request for quote to multiple garages at once (based on any particular criterion like location)? OR, both?
   * **Client**: User will get to select one or multiple garages based on their preferences.
     * BOTH (select one or more than one or ALL based on location -> city)

7. Can you please provide us a sample PDF of the report that is uploaded for the purpose of requesting quote?
   * **Client**: Available at iisifix google drive!

8. Regarding the Negotiability of the Quotation from the Garage:
   * Should the vehicle owner be able to negotiate the fees?
     * **Client**: YES! The vehicle owner can re-bid, accept or decline offer. 
       * **Dev**: Let's say, if the vehicle owner does not like the price quoted by the garage; then they talk; negotiate in comments. And at last, the garage owner can edit the quote and deal can be done; how does it sound?
         * **Client**: That would be awesome! We should track final deal so it can be bill accordingly. Good point!
   * Would commenting feature on the Quotation request/response would make business sense in MVP? Or at all? [Explanation:-  commenting would make the negotiation easier; and if that business transaction needs additional details then garage can ask for them] 
     * **Client** :If we drop inbox messaging feature from MVP then commenting on “Quotation request/response” does make sense. The idea of inbox messaging integration was to facilitate in negotiating quote, track quotation deal and establish clear medium of communication for our customers. Commenting will do this job for us. Let’s go for it!

9. We are thinking of skipping the Inbox Messaging feature from MVP; what's your say on this?
   * **Client**: We can skip inbox messaging feature from MVP!
