using { uM_Donations_ManagementSrv } from '../srv/service.cds';

annotate uM_Donations_ManagementSrv.Donors with @UI.HeaderInfo: { TypeName: 'Donor', TypeNamePlural: 'Donors', Title: { Value: name } };
annotate uM_Donations_ManagementSrv.Donors with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate uM_Donations_ManagementSrv.Donors with @UI.Identification: [{ Value: name }];
annotate uM_Donations_ManagementSrv.Donors with {
  name @title: 'Name';
  email @title: 'Email';
  phone @title: 'Phone';
  status @title: 'Status';
  donortype @title: 'Donor Type';
  isRecurringDonor @title: 'Is Recurring Donor';
  isHNI @title: 'Is HNI'
};

annotate uM_Donations_ManagementSrv.Donors with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: email },
 { $Type: 'UI.DataField', Value: phone },
 { $Type: 'UI.DataField', Value: status },
 { $Type: 'UI.DataField', Value: donortype },
 { $Type: 'UI.DataField', Value: isRecurringDonor },
 { $Type: 'UI.DataField', Value: isHNI }
];

annotate uM_Donations_ManagementSrv.Donors with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: email },
 { $Type: 'UI.DataField', Value: phone },
 { $Type: 'UI.DataField', Value: status },
 { $Type: 'UI.DataField', Value: donortype },
 { $Type: 'UI.DataField', Value: isRecurringDonor },
 { $Type: 'UI.DataField', Value: isHNI }
  ]
};

annotate uM_Donations_ManagementSrv.Donors with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate uM_Donations_ManagementSrv.Donors with @UI.SelectionFields: [
  name
];

annotate uM_Donations_ManagementSrv.Donations with @UI.HeaderInfo: { TypeName: 'Donation', TypeNamePlural: 'Donations' };
annotate uM_Donations_ManagementSrv.Donations with {
  donor @Common.ValueList: {
    CollectionPath: 'Donors',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: donor_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'donortype'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'isRecurringDonor'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'isHNI'
      },
    ],
  }
};
annotate uM_Donations_ManagementSrv.Donations with {
  donorName @title: 'Donor Name';
  donorEmail @title: 'Donor Email';
  donorPhone @title: 'Donor Phone';
  city @title: 'Donation City';
  amount @title: 'Amount';
  currencycode @title: 'Currency Code';
  donationdate @title: 'Donation Date';
  cause @title: 'Cause';
  campaign @title: 'Campaign';
  invoicenumber @title: 'Invoice Number'
};

annotate uM_Donations_ManagementSrv.Donations with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: donorName },
 { $Type: 'UI.DataField', Value: donorEmail },
 { $Type: 'UI.DataField', Value: donorPhone },
 { $Type: 'UI.DataField', Value: city },
 { $Type: 'UI.DataField', Value: amount },
 { $Type: 'UI.DataField', Value: currencycode },
 { $Type: 'UI.DataField', Value: donationdate },
 { $Type: 'UI.DataField', Value: cause },
 { $Type: 'UI.DataField', Value: campaign },
 { $Type: 'UI.DataField', Value: invoicenumber },
    { $Type: 'UI.DataField', Label: 'Donor', Value: donor_ID }
];

annotate uM_Donations_ManagementSrv.Donations with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: donorName },
 { $Type: 'UI.DataField', Value: donorEmail },
 { $Type: 'UI.DataField', Value: donorPhone },
 { $Type: 'UI.DataField', Value: city },
 { $Type: 'UI.DataField', Value: amount },
 { $Type: 'UI.DataField', Value: currencycode },
 { $Type: 'UI.DataField', Value: donationdate },
 { $Type: 'UI.DataField', Value: cause },
 { $Type: 'UI.DataField', Value: campaign },
 { $Type: 'UI.DataField', Value: invoicenumber },
    { $Type: 'UI.DataField', Label: 'Donor', Value: donor_ID }
  ]
};

annotate uM_Donations_ManagementSrv.Donations with {
  donor @Common.Text: { $value: donor.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate uM_Donations_ManagementSrv.Donations with {
  donor @Common.Label: 'Donor'
};

annotate uM_Donations_ManagementSrv.Donations with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate uM_Donations_ManagementSrv.Donations with @UI.SelectionFields: [
  donor_ID
];

