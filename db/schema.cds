namespace UM_Donations_Management;
using { cuid } from '@sap/cds/common';

entity CurrencyVH {
  key code  : String;
      label : String;
}

entity CauseVH {
  key code  : String;
      label : String;
}
entity campaignVH {
  key code  : String;
      label : String;
}


entity cityVH {
  key code  : String;
      label : String;
}


entity Donors : cuid {
  name: String(100) @mandatory;
  email: String(100);
  phone: String(15);
  status: String(20);
  donortype: String(20);
  isRecurringDonor: Boolean;
  isHNI: Boolean;
}

entity Donations : cuid {
  city: String(50);
  amount: Integer;
  currencycode: String(10) default 'USD';
  donationdate: Date default CURRENT_DATE;
  cause: String(100) default 'None';
  campaign: String(100) default 'None';
  invoicenumber: String(50);
  donor: Association to Donors;
}