using uM_Donations_ManagementSrv as service from '../../srv/service';
using from '../annotations';

annotate service.Donations with @(
    UI.FieldGroup #Main : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Donor',
                Value : donor_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : donor.email,
            },
            {
                $Type : 'UI.DataField',
                Value : donor.phone,
            },
            {
                $Type : 'UI.DataField',
                Value : donor.status,
            },
            {
                $Type : 'UI.DataField',
                Value : donor.isRecurringDonor,
            },
            {
                $Type : 'UI.DataField',
                Value : donor.isHNI,
            },
            {
                $Type : 'UI.DataField',
                Value : donor.donortype,
            },
            {
                $Type : 'UI.DataField',
                Value : city,
            },
            {
                $Type : 'UI.DataField',
                Value : amount,
            },
            {
                $Type : 'UI.DataField',
                Value : currencycode,
            },
            {
                $Type : 'UI.DataField',
                Value : donationdate,
            },
            {
                $Type : 'UI.DataField',
                Value : cause,
            },
            {
                $Type : 'UI.DataField',
                Value : invoicenumber,
            },
            {
                $Type : 'UI.DataField',
                Value : campaign,
            },
            
        ],
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Donor',
            Value : donor_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : donor.email,
        },
        {
            $Type : 'UI.DataField',
            Value : donor.phone,
        },
        {
            $Type : 'UI.DataField',
            Value : city,
        },
        {
            $Type : 'UI.DataField',
            Value : amount,
        },
        {
            $Type : 'UI.DataField',
            Value : currencycode,
        },
        {
            $Type : 'UI.DataField',
            Value : donationdate,
        },
        {
            $Type : 'UI.DataField',
            Value : cause,
        },
        {
            $Type : 'UI.DataField',
            Value : campaign,
        },
        {
            $Type : 'UI.DataField',
            Value : invoicenumber,
        },
    ],
);

annotate service.Donors with {
    donortype @Common.FieldControl : #ReadOnly
};

annotate service.Donors with {
    isHNI @Common.FieldControl : #ReadOnly
};

annotate service.Donors with {
    isRecurringDonor @Common.FieldControl : #ReadOnly
};

annotate service.Donors with {
    status @Common.FieldControl : #ReadOnly
};

annotate service.Donors with {
    email @Common.FieldControl : #ReadOnly
};

annotate service.Donors with {
    phone @Common.FieldControl : #ReadOnly
};

annotate service.Donations with {
    currencycode @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CurrencyVH',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : currencycode,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Currency',
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Donations with {
    cause @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CauseVH',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : cause,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Cause',
        },
        Common.ValueListWithFixedValues : true,
)};



