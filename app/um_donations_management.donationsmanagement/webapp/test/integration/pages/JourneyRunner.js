sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"umdonationsmanagement/donationsmanagement/test/integration/pages/DonationsList",
	"umdonationsmanagement/donationsmanagement/test/integration/pages/DonationsObjectPage"
], function (JourneyRunner, DonationsList, DonationsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('umdonationsmanagement/donationsmanagement') + '/test/flpSandbox.html#umdonationsmanagementdonations-tile',
        pages: {
			onTheDonationsList: DonationsList,
			onTheDonationsObjectPage: DonationsObjectPage
        },
        async: true
    });

    return runner;
});

