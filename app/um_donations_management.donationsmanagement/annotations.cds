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
                Value : city,
            },
            {
                $Type : 'UI.DataField',
                Value : donor.status,
                @UI.Hidden,
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
            Value : invoicenumber,
        },
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
            Label : 'City',
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
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Main',
            Label : 'General Information',
            Target : '@UI.FieldGroup#Main',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Message',
            ID : 'Message',
            Target : '@UI.FieldGroup#Message',
        },
    ],
    UI.FieldGroup #Message : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : message,
                Label : 'message',
            },
        ],
    },
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
        Common.FieldControl : #Mandatory,
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
        Common.FieldControl : #Optional,
)};



annotate service.Donations with {
    invoicenumber @Common.FieldControl : #ReadOnly
};

annotate service.Donations with {
    amount @Common.FieldControl : #Mandatory
};

annotate service.Donations with {
    donor @Common.FieldControl : #Mandatory
};

annotate service.Donations with {
    city @(
        Common.FieldControl : #Mandatory,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'cityVH',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : city,
                    ValueListProperty : 'label',
                },
            ],
            Label : 'CityH',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Donations with {
    donationdate @Common.FieldControl : #Mandatory
};

annotate service.Donations with {
    campaign @(
        Common.FieldControl : #Mandatory,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'campaignVH',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : campaign,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Campaign',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Donations with {
    massage @(
        UI.MultiLineText : true,
        )
};

annotate service.Donations with {
    message @(
        UI.MultiLineText : true,
        Common.FieldControl : #ReadOnly,
    )
};

